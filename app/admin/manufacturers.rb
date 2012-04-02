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

end
