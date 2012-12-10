ActiveAdmin.register User do
  index do 
    selectable_column
    column :id
    column :name
    column :email
    column :city
    default_actions
  end
end
