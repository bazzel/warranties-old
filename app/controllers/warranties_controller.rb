class WarrantiesController < ApplicationController

  def index

  end

  def new
    @warranty = Warranty.new
  end

  def show
    @warranty = Warranty.find(params[:id])
  end

  def create
    @warranty = Warranty.new(params[:warranty])
    @warranty.save

    redirect_to(warranty_path(@warranty), :notice => "New warranty created.")
  end
end
