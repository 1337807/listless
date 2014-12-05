class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :auth_with_google!

  def after_sign_in_path_for(resource)
    lists_path
  end

  private

  def auth_with_google!
    redirect_to user_omniauth_authorize_path(provider: 'google_oauth2') unless current_user
  end
end
