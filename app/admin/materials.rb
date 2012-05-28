# coding: utf-8
ActiveAdmin.register Material do
  form :partial => "form"
  
  index do
    selectable_column
    column :id
    column :name, sortable: true
    column :manufacturer
    default_actions
  end

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
              link_to image_tag(img.image.flat.url, size: "100x80"), img.image.main.url, target: "_blank"
            end
          end
        end
      end
    end

    h3 "Anexos" do
      div do
        ol :id => "attachments_list" do
          material.attachments.each do |f|
            li do
              link_to f.name, f.file.url, target: "_blank"
            end
          end
        end
      end
    end
    active_admin_comments
  end
end
