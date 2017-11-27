class MsgController < ApplicationController
  def new
  end

  def msg_send
    require 'rest-client'
    #url = "https://api.telegram.org/"


    token='380132581:AAGdUEwY_QZ2fJF1Bpmho2F-2DsWV_7BjBo'

    response = RestClient.get("https://api.telegram.org/bot#{token}/getUpdates")
    @res_json = JSON.parse(response)

  # ap @res_json["result"][0]["message"]["from"]["id"]

    chat_id = @res_json["result"][0]["message"]["from"]["id"]
    puts chat_id
    msg = "안가냐"
    url = "https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{chat_id}&text=#{msg}"
    RestClient.get(URI.encode(url))
    redirect_to 'msg/new'
  end

end
