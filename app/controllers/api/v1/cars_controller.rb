class Api::V1::CarsController < Api::V1::ApiController
  def index
    @cars = Car.available

    render json: @cars
  end
end