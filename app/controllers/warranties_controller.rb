class WarrantiesController < ApplicationController

  def index
    @warranties = current_user.warranties.all
  end

  def new
    @warranty = Warranty.new
  end

  def show
    @warranty = Warranty.find(params[:id])
  end

  def create
    @warranty = current_user.warranties.build(params[:warranty])
    if @warranty.save
      redirect_to(warranty_path(@warranty), :notice => "New warranty created.")
    else
      render :new
    end
  end
end
