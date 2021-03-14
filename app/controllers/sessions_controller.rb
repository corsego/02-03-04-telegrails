class SessionsController < ApplicationController
  
  def create
    session[:user_id] = params[:id]
    session[:username] = params[:username]
    redirect_to root_path, notice: "successful login via telegram"
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path, notice: "logged out!"
  end
  
end