class MaterialsController < ApplicationController
  inherit_resources
  has_scope :offset
  has_scope :limit, default: 5, only: [:index]
  has_scope :limit, default: 9, only: [:explore]

  include ApplicationHelper

  def index
    @materials  ||= Material.offset(params[:offset].to_i).all
    return render partial: "blocks" if request.xhr?
  end

  def explore 
    if params[:category]
      @category ||= Category.find(params[:category])
      @count = @category.materials.length
      @resource ||= @category.materials.limit(9).offset(params[:offset].to_i)
    else
      @count = Material.all.length
      @resource ||= collection
    end

    return render partial: "materials" if request.xhr?
  end
end
