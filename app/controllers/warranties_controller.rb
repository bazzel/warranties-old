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

  def edit
    @warranty = current_user.warranties.find(params[:id])
  end

  def create
    @warranty = current_user.warranties.build(params[:warranty])
    if @warranty.save
      redirect_to(warranty_path(@warranty), :notice => t('flash.warranty_created'))
    else
      render :new
    end
  end

  def update
    @warranty = current_user.warranties.find(params[:id])

    if @warranty.update_attributes(params[:warranty])
      redirect_to(warranty_path(@warranty), :notice => t('flash.warranty_updated'))
    else
      render :edit
    end
  end

  def destroy
    @warranty = current_user.warranties.find(params[:id])
    @warranty.destroy
    redirect_to(warranties_path, :notice => "Warranty deleted.")
  end
end
