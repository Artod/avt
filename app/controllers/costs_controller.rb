class CostsController < ApplicationController
  # GET index
  def index
  end

  # POST search
  def search
    out = [];
    depart_city = params[:depart_city]
    if !depart_city.empty?
      
      # find first city
      origin_id = City.find_origin_id(depart_city)

      # find minimal prices
      @prices = Cost.find_minimal_prices(origin_id, params)
      
      @prices.each do |price|
        destination = price.destination
        out << {
          destination: {id: destination.id, latitude: destination.latitude, longitude: destination.longitude},
          price: {value: price.value, depart_date: price.depart_date, return_date: price.return_date}
        }
      end
    end

    if request.xhr?
      render json: out
    else
      render text: 'Hello!'
    end
  end
end

# BETWEEN '2008-12-21 00:00:00' AND '2008-12-22 00:00:00'