MateriaBrasil::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  get 'material/:id',       to: "materials#show",     as: :material
  get 'explore/:category',  to: "materials#explore",  as: :category
  get 'explore/',           to: "materials#explore",  as: :explore    
  get 'materials',          to: "materials#index",    as: :materials
  root                      to: "materials#index"
end
