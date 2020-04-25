class SubsidiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
    sub_params = params.require(:subsidiary).permit(:name, :address, :cnpj)
    @subsidiary = Subsidiary.new(sub_params)
    if @subsidiary.save
      redirect_to @subsidiary 
    else
      render :new
    end
  end

end