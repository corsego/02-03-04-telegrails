class TelegramMailer < ApplicationMailer

  def send_group_message(text)
    api_key = TELEGRAM
    chat_id = -572374068
    # chat_id = 450462613
    # text = "I am feeling great today"
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
  end

  def send_private_message(text, user)
    api_key = TELEGRAM
    # chat_id = 450462613
    # text = "I am feeling great today"
    # HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage?chat_id=#{chat_id}&text=#{text}")
    HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        chat_id: user,
        text: text
      }.to_json
    )
  end



end
