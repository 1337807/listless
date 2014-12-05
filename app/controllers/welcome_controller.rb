class WelcomeController < ApplicationController
  skip_before_filter :auth_with_google!, :only => [:index]

  def index
    redirect_to lists_path if current_user
  end
end
