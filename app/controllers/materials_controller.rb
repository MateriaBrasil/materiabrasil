class MaterialsController < ApplicationController
  def index
    if params[:category]
      @category = Category.find(params[:category])
      @resource = @category.materials
    else
      @resource = Material.all
    end
  end

  def show
    @material = Material.find(params[:id])
  end
end
