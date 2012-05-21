#coding: utf-8
ActiveAdmin.register Manufacturer do
  menu :label => "Fabricantes"
  
  index do 
    column :name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Dados sobre o fabricante" do
      f.input :name, :label => "Nome"
      f.input :razao_social
      f.input :cnpj
      f.input :insc_estadual
      f.input :insc_municipal
      f.input :address, :label => "Endereço"
      f.input :city,  :label => "Cidade"
      f.input :state, :label => "Estado"
      f.input :cep,   :label => "CEP"
      f.input :country, :label => "País", :as => :string
      f.input :mail_address, :label => "Endereço para correspondência" 
      f.input :site
      f.input :certifications, :label => "Normas e certificações"
    end

    f.inputs "Contact" do
      f.has_many :contacts do |contact|
        contact.input :definition, :label => "Setor/Outro"
        contact.input :name, :label => "Nome"
        contact.input :email
        contact.input :phone_first, :label => "Telefone Principal"
        contact.input :phone_second, :label => "Telefone Secundário"
        contact.input :address, :label => "Endereço"
      end
    end

    f.buttons
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
