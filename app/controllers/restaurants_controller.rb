class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }

    # Code API pour récupérer la note du restaurant
    input = @restaurant.name.gsub(' ', '%20').gsub('à', 'a').gsub('é', 'e').gsub('è', 'e').gsub('ô', 'o').gsub('ö', 'o').gsub('ê', 'e').gsub('ë', 'e')
    @input = input
    url = URI("https://api.yelp.com/v3/businesses/search?location=#{input}&sort_by=best_match&limit=1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["authorization"] = 'Bearer POepIZi6kVQFMgPgUZ-Sz0EflbZEoOD9UF4nkZw5TnEXa05GI0k_yu4qsW7KQ42UDMzgB0WDXh0zVHAzpDaDMu0b2geDBn7m6M5K4tgTjLonYmzAlvA-CovUj-XXZ3Yx'

    response = http.request(request)
    # puts response.read_body

    data = JSON.parse(response.read_body)
    dataResponse = data["businesses"]

    if dataResponse ==nil
      @rating = "0"
    else
      @rating = "#{dataResponse[0]["rating"]}"
    end
  end
end
