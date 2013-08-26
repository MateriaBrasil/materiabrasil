# coding: utf-8
class MaterialsController < ApplicationController
  inherit_resources
  has_scope :offset
  has_scope :limit, default: 5, only: [:index]
  has_scope :limit, default: 9, only: [:explore]

  include ApplicationHelper

  def index
    @materials  ||= Material.approved.limit(12)
    @partners = [
      {name: "Embraer", img: "embraer.png", url: "http://www.embraer.com/"},
      {name: "Siemens", img: "siemens.png", url: "http://www.respostassustentaveis.com.br/"},
      {name: "Jomo", img: "jomo.png", url: "http://www.jomo-online.com.br/"},
      {name: "GoodYear", img: "goodyear.png", url: "http://www.goodyear.com/"},
      {name: "Santander", img: "santander.png", url: "http://www.santander.com/"},
      {name: "Alstom", img: "alstom.png", url: "http://www.alstom.com/"},
      {name: "Ministério do Desenvolvimento Agrário", img: "mda.png", url: "http://portal.mda.gov.br/portal/"},
      {name: "Bunge", img: "bunge.png", url: "http://www.bunge.com.br/"},
      {name: "GNT", img: "gnt.png", url: "http://gnt.globo.com/"},
      {name: "Jardim Botânico do Rio de Janeiro", img: "jardim_botanico.png", url: "http://www.jbrj.gov.br/"},
      {name: "Studio Arthur Casas", img: "sac.png", url: "http://www.arthurcasas.com/"},
      {name: "Casa Arte & Design", img: "cad.png", url: "http://www.casaartedesign.com.br/index2.php"},
      {name: "Sebrae", img: "sebrae.png", url: "http://www.sebrae.com.br/"},
      {name: "Governo do Rio de Janeiro", img: "gov_rj.png", url: "http://www.rj.gov.br/"},
      {name: "Marin's", img: "marins.png", url: "http://www.marins.net/"},
      {name: "FAPERJ", img: "faperj.png", url: "http://www.faperj.br/"}
    ]
    # return render partial: "blocks" if request.xhr?
  end

  def explore
    if params[:category]
      @category ||= Category.find(params[:category])
      @count = @category.materials.approved.count
      @resource ||= @category.materials.approved.limit(9).offset(params[:offset].to_i)
    else
      @count = Material.approved.count
      @resource ||= Material.approved
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

  def create
    manufacturer = current_user.manufacturer || Manufacturer.create(name: current_user.name, user: current_user)
    @material = Material.new(params[:material])
    @material.manufacturer = manufacturer
    create! { material_categories_path(@material.id) }
  end

  def edit_attachments
    @material = Material.find(params[:material_id])
    @material.images.build
    @material.attachments.build
    return render 'edit_attachment'
  end

  def update
    update! { material_categories_path(@material) }
  end

  def update_categories
    update! { material_edit_attachments_path(@material) }
  end

  def update_attachments
    update! { edit_manufacturer_path(current_user.manufacturer) }

  def new
    manufacturer = current_user.manufacturer || Manufacturer.create(name: current_user.name)
    @material = Material.new manufacturer: manufacturer
    return render action: 'new'
  end
end
