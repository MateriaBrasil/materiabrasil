class MaterialsController < ApplicationController
  def index
    @category = Category.find(params[:category]) if params[:category] 
  end

  def show
    @material = Material.find(params[:id])
  end
end
