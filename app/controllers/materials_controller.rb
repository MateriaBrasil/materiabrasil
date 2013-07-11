# coding: utf-8
class MaterialsController < ApplicationController
  inherit_resources
  has_scope :offset
  has_scope :limit, default: 5, only: [:index]
  has_scope :limit, default: 9, only: [:explore]

  include ApplicationHelper

  def index
    @materials  ||= Material.limit(12)
    @partners = [
      {name: "Embraer", img: "embraer.png", url: "#"},
      {name: "Siemens", img: "siemens.png", url: "#"},
      {name: "Jomo", img: "jomo.png", url: "#"},
      {name: "GoodYear", img: "goodyear.png", url: "#"},
      {name: "Santander", img: "santander.png", url: "#"},
      {name: "Alstom", img: "alstom.png", url: "#"},
      {name: "Ministério do Desenvolvimento Agrário", img: "mda.png", url: "#"},
      {name: "Bunge", img: "bunge.png", url: "#"},
      {name: "GNT", img: "gnt.png", url: "#"},
      {name: "Jardim Botânico do Rio de Janeiro", img: "jardim_botanico.png", url: "#"},
      {name: "Studio Arthur Casas", img: "sac.png", url: "#"},
      {name: "Casa Arte & Design", img: "cad.png", url: "#"},
      {name: "Sebrae", img: "sebrae.png", url: "#"},
      {name: "Governo do Rio de Janeiro", img: "gov_rj.png", url: "#"},
      {name: "Marin's", img: "marins.png", url: "#"},
      {name: "FAPERJ", img: "faperj.png", url: "#"}
    ]
    # return render partial: "blocks" if request.xhr?
  end

  def explore 
    if params[:category]
      @category ||= Category.find(params[:category])
      @count = @category.materials.count
      @resource ||= @category.materials.limit(9).offset(params[:offset].to_i)
    else
      @count = Material.count
      @resource ||= collection
    end

    return render partial: "materials" if request.xhr?
  end


  def search
    if params[:q]
      @resource = Material.search_by_name_and_category(params[:q])
      @count = @resource.count
      return render action: "explore" unless request.xhr?
      return render partial: "materials" if request.xhr?
    end
  end
end
