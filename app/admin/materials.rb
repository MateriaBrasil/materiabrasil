# coding: utf-8
ActiveAdmin.register Material do
  menu :label => "Materiais"

  form :partial => "form"


  show :title => :name do |material|
    attributes_table do
      row :id
      row :name
      row :manufacturer
      row :average_price
      row :density
      row :dimensions
      row :packing

      row :resume
      row :technical_observation
    end

    h3 "Imagens" do
      div do
        ol :id => "images_list" do
          material.images.each do |img|
            li do
              image_tag img.image.thumbnail.url
            end
          end
        end
      end
    end

    active_admin_comments
  end
end
