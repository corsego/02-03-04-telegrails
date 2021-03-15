class SessionsController < ApplicationController
  
  def create
    fields = %w[auth_date first_name id last_name photo_url username]
    secret = OpenSSL::Digest::SHA256.digest(TELEGRAM)
    signature = fields.filter { |f| params[f] }.map{ |f| "%s=%s" % [f, params[f]] }.join("\n")
    hashed_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA256.new, secret, signature)
    if params[:hash] == hashed_signature
      session[:user_id] = params[:id]
      session[:username] = params[:username]
      redirect_to root_path, notice: "successful login via telegram"
    else
      redirect_to root_path, notice: "LIAR"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_path, notice: "logged out!"
  end
  
end