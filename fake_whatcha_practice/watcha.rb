require 'httparty'
require 'rest-client'
require 'json'
require 'awesome_print'

headers = {
	cookie: "_s_guit=QikRpQcXPHTi8pq0qA7uNlq7zWU4PJriobIKwTByyUUeHStdXH1FHb6JjNoT; __uvt=; fbm_126765124079533=base_domain=.watcha.net; _ga=GA1.2.780179800.1511237867; _gid=GA1.2.1777917437.1511237867; fbsr_126765124079533=qeMjQWWe1ZpHUoVFrJSuyFipI8ly-WaOyT7wTgkZaro.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUFONFU5dGd6TjhhbUFqcmM5OXJRa2NNaUpFUk55a19VOU13em93Y0daZzhHNnoyYjA4UTRPT0RZVVJ5Zl9tTjhGa3lWZ3V3M1plTFZnVlplX2ZGN2NvcEhuWE9wT3d6dEMtdWkxa0NDNkFUZGhUNzZEb1NYXzlsWVRUTGFIYWNnYkF4dUd6MHpkNmZjOFZ1WGk5TWY0M2xTYVBtdldVOU43YVU4LU1YSjk5OGlsWGRteXFLdVdURDBnWGczeGtnaEgzT29mSnFjRlZDZ2RQakg5dFJ4V3dESGdvQWFaRkthS2RkS1VBZ3lxT2FVTTFvM2M1VXdTZllQb2dNazNmbHlwWUlsaUsyRk1jZmE2eHJNZWVnTEp0b3JGeFdjTkxpbGpjczJOMWh2Yk82bWNfOHdmYkRRZFZtU0RiYmpqai03WEY1ODl0R3FkOFJQaVV6dVZ5THFHUCIsImlzc3VlZF9hdCI6MTUxMTIzODA3MiwidXNlcl9pZCI6IjEwMDAwMjk3NDU1NzMzNCJ9; uvts=6n2Ojy9kuDzz67sz; _guinness_session=QU82Vm1YOU5XTGw0RW9UM0Yrc1FpNllYdEVta2JpTVVNNTFjbHR3MWdSYmhnTXZFRENOTUxvUTBhWEhmNjZsdS96RG8wNkZSR1ZEUG1qQXd6NVA5WlRBK0FacVpOZlhXV1AxcGM0ZUlQem8vODRRSTZwdkJoakwya2I0cHY0OSs3YnM3RXpiV3BJcTg2TDNPMFRLM3NoN0pZZkFsZGNFb2FkRkZuWkpGeDFzTVBUS2xwNjM1NkY2eFhEMitTMlJZLS1ydFdGU21SS1JmanhLRzJiZEUxWS9nPT0%3D--264a270eb84e7bc337b60f4862da33b2570ff46d"
}
res = HTTParty.get("https://watcha.net/boxoffice.json",:headers => headers)

watcha = JSON.parse(res.body)



title = watcha["cards"][0]["items"][0]["item"]["title"]
image = watcha["cards"][0]["items"][0]["item"]["poster"]["large"]
desc = watcha["cards"][0]["items"][0]["item"]["interesting_comment"]["text"]


# ap watcha["cards"].first["items"].first["item"]["title"]

# CSV.open("movie_ist.csv", "wb") do |csv|
#   csv << [title,image,desc]
# end
CSV.open("movie_list.csv", "wb") do |csv|
watcha["cards"].each do |cards|
      # ap cards
    cards["items"].each do |items|
    
      title = items["item"]["title"]
     
      image = items["item"]["poster"]["large"]
     
        if !items["item"]["interesting_comment"].nil?
          desc = items["item"]["interesting_comment"]["text"]
        else
          p "커멘트가 없습니다."
        end
     csv << [title,image,desc]
    end
end
end