#coding: utf-8
ActiveAdmin.register Category do
  config.paginate = false

  index :paginate => false, :as => :block do |category|
    unless category.parent
      div :id => :wrap do
        div :for => category, :class => "category index_category parent_category" do
          h4 auto_link(category.name)
          div do
            ul :class => :categories do
              if category.children.present?
                render :partial => "children", :locals => { :children => category.children }
              end
            end
          end
        end
      end
    end
  end


  form do |f|
    f.inputs "Categoria-pai?" do
      f.input :parent, :label => false
    end

    f.inputs "Nome da categoria" do
      f.input :name, :label => false
    end

    f.inputs "Código de referência (será utilizado como código nos materiais)" do
      f.input :code_reference, :label => false
    end


    f.inputs "Visível para os usuários?" do
      f.input :is_visible, as: :boolean
    end

    f.buttons
  end

end

