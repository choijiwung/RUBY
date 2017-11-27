require 'rest-client'
require 'json'
require 'awesome_print'
require 'telegram_bot'
require 'nokogiri'

token='380132581:AAGdUEwY_QZ2fJF1Bpmho2F-2DsWV_7BjBo'

def get_kospi
	url="http://www.moneycontrol.com/live-market/kospi"
	response = RestClient.get(url)
	text = Nokogiri::HTML(response)
	kospi = text.css('#live_data_indices > div:nth-child(2) > div.FL.gr_35 > strong')
	kospi
end



   user = RestClient.get("https://api.telegram.org/bot#{token}/getMe")
    @user_json = JSON.parse(user)

   # ap @user_json["result"]["id"]

   response = RestClient.get("https://api.telegram.org/bot#{token}/getUpdates")
    @res_json = JSON.parse(response)

   # ap @res_json["result"][0]["message"]["from"]["id"]

chat_id = @res_json["result"][0]["message"]["from"]["id"]
msg= "오늘의 코스피 지수는 #{get_kospi}"
url = "https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{chat_id}&text=#{msg}"


RestClient.get(URI.encode(url))
end

