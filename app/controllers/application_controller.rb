class ApplicationController < ActionController::Base
  before_action :authenticate_user
  
  private
    def authenticate_user
      if session[:user_id].nil?
        redirect_to sessions_new_path, alert: "Sign in to continue"
      end
    end

end
