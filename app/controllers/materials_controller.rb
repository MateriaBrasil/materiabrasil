class MaterialsController < ApplicationController
  inherit_resources
  has_scope :offset
  has_scope :limit, default: 5, only: [:index]

  def explore 
    if params[:category]
      @category ||= Category.find(params[:category])
      @resource ||= @category.materials
    else
      @resource ||= Material.all
    end
  end
end
