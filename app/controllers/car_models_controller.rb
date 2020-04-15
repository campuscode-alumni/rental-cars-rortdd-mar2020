class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end

  def show
    @car_model = CarModel.find(params[:id])
  end

  def new
  end

  def create
    car_model_params = params.require(:car_model)
                             .permit(:name, :fuel_type, :motorization,
                                     :year, :manufacturer_id,
                                     :car_category_id)


    @car_model = CarModel.new(car_model_params)
    @car_model.save
    redirect_to @car_model
  end
end