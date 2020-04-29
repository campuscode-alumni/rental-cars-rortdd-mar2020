class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @car_categories = CarCategory.all
    @customers = Customer.all
  end

  def create
    @rental = Rental.new(params.require(:rental).permit(:start_date, :end_date,
                                                        :car_category_id, :customer_id))
    if @rental.save
      flash[:success] = 'Locação cadastrada com sucesso'
      redirect_to rentals_path
    else
      @car_categories = CarCategory.all
      @customers = Customer.all
      render :new
    end
  end

  def search
    @rentals = Rental.where(code: params[:q])
    render :index
  end

  def start
    @rental = Rental.find(params[:id])
    car_models = @rental.car_category.car_models
    @available_cars = Car.where(car_model: car_models)
    # No banco de dados, são procurados todos os carros que o modelo esteja no
    # array de modelos da categoria
    #SELECT * FROM cars WHERE car_model_id IN 1,2,5,10
  end

  def confirm
    @rental = Rental.find(params[:id])

    #@rental.update(status: :ongoing)
    @rental.ongoing!

    @car = Car.find(params[:car_id])
    # aqui a magia vai acontecer
    redirect_to @rental
  end

  def show
    @rental = Rental.find(params[:id])
  end
end