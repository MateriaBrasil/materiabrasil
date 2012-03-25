# coding: utf-8
ActiveAdmin.register Material do

  form do |f|
    f.inputs "Categorias" do
      f.input :categories, :as => :check_boxes, :label => "Categorias"
    end
    f.inputs "Sobre o material" do
      f.input :resume, :label => "Resumo"
    end

    f.inputs "Informações técnicas" do
      f.input :technical_observation, :label => "Observações Técnicas"
    end

    f.inputs "Detalhes técnicos" do
      f.input :density, :label => "Densidade"
      f.input :dimensions, :label => "Dimensões"
      f.input :packing, :label => "Embalagem"
      f.input :average_price, :label => "Preço Médio"
    end
    f.buttons
  end
end
