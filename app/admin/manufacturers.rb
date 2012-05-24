#coding: utf-8
ActiveAdmin.register Manufacturer do
  
  index do 
    selectable_column
    column :name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Dados sobre o fabricante" do
      f.input :name
      f.input :razao_social
      f.input :cnpj
      f.input :insc_estadual
      f.input :insc_municipal
      f.input :address
      f.input :city
      f.input :state
      f.input :cep
      f.input :country, as: :string
      f.input :mail_address
      f.input :site
      f.input :certifications
    end

    f.inputs "Contatos" do
      f.has_many :contacts do |contact|
        contact.input :definition
        contact.input :name
        contact.input :email
        contact.input :phone_first
        contact.input :phone_second
        contact.input :address
      end
    end

    f.actions
  end


  show :title => :name do |m|
    attributes_table do
      row :id
      row :name
      row :email
      row :address
    end

    h3 "Contatos"
    div do
      ol :id => "contacts_list" do
        m.contacts.each do |c|
          li do
            div do
              span "(#{c.definition}) - "
              strong "#{c.name} -"
              span "[#{c.email}] #{c.phone_first}"
            end
          end
        end
      end
    end
    active_admin_comments
  end

end
