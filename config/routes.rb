MateriaBrasil::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


  match "auth/:provider/callback",      to: "sessions#create"
  resources :sessions, only: [:new, :destroy]

  get 'auth/facebook',                  as: :facebook_auth
  get 'material/:id',                   to: "materials#show",     as: :material
  get 'explore/:category',              to: "materials#explore",  as: :category
  get 'explore/',                       to: "materials#explore",  as: :explore    
  get 'materials',                      to: "materials#index",    as: :materials
  get 'sobre/',                         to: "pages#about",        as: :about
  get 'busca/',                         to: "materials#search",    as: :search
  root                                  to: "materials#index"
end
