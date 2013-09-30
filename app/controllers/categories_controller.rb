# coding: utf-8
class CategoriesController < ApplicationController
  inherit_resources
  belongs_to :material

  def create
    create! { raise parent.inspect }
  end
end
