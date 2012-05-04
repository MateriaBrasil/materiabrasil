MateriaBrasil::Application.routes.draw do

  devise_for :users

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  unless Rails.env.production?

    get 'explore/', to: "materials#index", as: :explore    
    get 'search', to: "pages#search", as: :search
    match 'material/:id', to: "materials#show", as: :material
    match ':category/explore', to: "materials#index", as: :category

    root to: "pages#index"
    
  else
    root :to => "pages#splash"
  end
end
