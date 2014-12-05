class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :auth_with_google!, only: [:google_oauth2]

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @user.authorized?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:alert] = 'You are not an authorized user, contact Jonan to get on the list.'
      redirect_to root_path
    end
  end
end
