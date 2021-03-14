class HomeController < ApplicationController
  def index
  end

  def group_message
    api_key = TELEGRAM
    chat_id = -572374068
    # chat_id = 450462613
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

end
