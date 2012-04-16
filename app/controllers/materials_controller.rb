class MaterialsController < ApplicationController
  def index
    @categories = Category.parent
  end

  def show
  end
end
