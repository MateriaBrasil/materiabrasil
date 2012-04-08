#coding: utf-8
ActiveAdmin.register Manufacturer do
  menu :label => "Fabricantes"


  form do |f|
    f.inputs "Dados sobre o fabricante" do
      f.input :name, :label => "Nome"
      f.input :email
      f.input :address, :label => "Endereço"
    end

    f.inputs "Contact" do
      f.has_many :contacts do |contact|
        contact.input :definition, :label => "Setor/Outro"
        contact.input :name, :label => "Nome"
        contact.input :email
        contact.input :phone_first, :label => "Telefone Principal"
        contact.input :phone_second, :label => "Telefone Secundário"
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
