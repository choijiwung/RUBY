require 'launchy'

keywords =["수지","아이유","설현"]

url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="

# each 활용 array iteration(url +)
# keywords.each do |key|
# Launchy.open(url + key)
# end

# for 활용 array iteration
for key in keywords
Launchy.open(url+ key)
end


# while 활용 array iteration

# Launchy.open(URL + keywords[1])
# print URL + keywords[1]

