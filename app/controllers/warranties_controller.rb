class WarrantiesController < ApplicationController

  def index

  end

  def new
    @warranty = Warranty.new
  end

  def create
    @warranty = Warranty.new(params[:warranty])
    @warranty.save

    redirect_to(warranties_path)
  end
end
