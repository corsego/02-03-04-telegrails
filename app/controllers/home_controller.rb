class HomeController < ApplicationController
  def index
  end

  def group_message
    HTTParty.post('https://api.telegram.org/bot1601291955:AAHTBAjaqigyYL_5Y70WVMglsnQ_EYPfwDk/sendMessage?chat_id=-572374068&text=hello world')

    redirect_to root_path, notice: "success"
  end

end
