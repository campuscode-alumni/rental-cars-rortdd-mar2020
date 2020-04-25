class SubsidiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @subsidiaries = Subsidiary.all
  end
end