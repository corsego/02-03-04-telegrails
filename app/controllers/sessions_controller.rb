class SessionsController < ApplicationController
  
  def create
    session[:user_id] = params[:id]
    session[:username] = params[:username]
    redirect_to root_path, notice: "successful login via telegram"
  end
  
end