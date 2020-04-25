class CustomersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    customer_params = params.require(:customer).permit(:name, :cpf, :email)
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
