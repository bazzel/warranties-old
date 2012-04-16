class WarrantiesController < ApplicationController
  before_filter :find_warranty, :only => [:show, :edit, :update, :destroy]

  def index
    @warranties = current_user.warranties.all
  end

  def new
    @warranty = Warranty.new
  end

  def show
  end

  def edit
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
    if @warranty.update_attributes(params[:warranty])
      redirect_to(warranty_path(@warranty), :notice => t('flash.warranty_updated'))
    else
      render :edit
    end
  end

  def destroy
    @warranty.destroy
    redirect_to(warranties_path, :notice => t('flash.warranty_destroyed'))
  end

  private
    def find_warranty
      @warranty = current_user.warranties.find(params[:id])
    end
end
