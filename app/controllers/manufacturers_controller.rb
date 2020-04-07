class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    render 'index'
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    render 'show'
  end

  def new
    @manufacturer = Manufacturer.new
    render 'new'
  end

  def create
    name = params[:manufacturer][:name]
    @manufacturer = Manufacturer.new
    @manufacturer.name = name

    if @manufacturer.save
      redirect_to @manufacturer
    else
      render 'new'
    end
  end

  def update
  end
end