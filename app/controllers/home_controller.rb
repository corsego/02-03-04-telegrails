class HomeController < ApplicationController
  def index
  end

  def send_message
    api_key = TELEGRAM
    # chat_id = -572374068
    # chat_id = 450462613
    chat_id = session[:user_id]
    text = "I am feeling great today"
    # HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage?chat_id=#{chat_id}&text=#{text}")
    HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        chat_id: chat_id,
        text: text
      }.to_json
    )

    redirect_to root_path, notice: "success"
  end

  def send_hello
    text = params[:content]
    TelegramMailer.send_group_message(text).deliver_now
    TelegramMailer.send_private_message(text, session[:user_id]).deliver_now
    redirect_to root_path, notice: "success"
  end

end
