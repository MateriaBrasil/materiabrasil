MateriaBrasil::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


  #match "auth/:provider/callback",      to: "sessions#create"
  #resources :sessions, only: [:new, :destroy]

  resources :materials, only: [:index, :show, :new, :update, :create] do
    resources :categories, only: [:new]
    get 'attachments/new', to: 'materials#new_attachments', as: :new_attachments
  end

  #get 'material/:id',                   to: "materials#show",     as: :material
  get 'explore/:category',              to: "materials#explore",  as: :category
  get 'explore/',                       to: "materials#explore",  as: :explore
  #get 'materials',                      to: "materials#index",    as: :materials
  get 'sobre/',                         to: "pages#about",        as: :about
  #get 'materials/new',                  to: 'materials#new',      as: :new_material
  #get 'categories/new',                 to: 'categories#new',     as: :new_category
  get 'submit/',                        to: "pages#submit",       as: :submit
  get 'busca/',                         to: "materials#search",   as: :search
  root                                  to: "materials#index"
end
