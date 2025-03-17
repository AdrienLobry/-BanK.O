require 'uri'
require 'net/http'
require 'json'

puts "Entrer le nom du restaurant :"
input = gets.chomp
input = input.gsub(' ', '%20')
url = URI("https://api.yelp.com/v3/businesses/search?location=#{input}&sort_by=best_match&limit=1")

puts url

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

puts http

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Bearer POepIZi6kVQFMgPgUZ-Sz0EflbZEoOD9UF4nkZw5TnEXa05GI0k_yu4qsW7KQ42UDMzgB0WDXh0zVHAzpDaDMu0b2geDBn7m6M5K4tgTjLonYmzAlvA-CovUj-XXZ3Yx'

response = http.request(request)
puts response.read_body

data = JSON.parse(response.read_body)

test = data["businesses"]

puts test[0]["location"]["address1"]
puts test[0]["location"]["city"]
puts test[0]["location"]["zip_code"]
puts test[0]["rating"]
