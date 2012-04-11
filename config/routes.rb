MateriaBrasil::Application.routes.draw do

  devise_for :users

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  unless Rails.env.production?
    root to: "pages#index"

  else
    root :to => "pages#splash"
  end
end
