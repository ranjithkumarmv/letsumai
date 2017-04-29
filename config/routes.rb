Rails.application.routes.draw do
  resources :addresses
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :customers do
  get 'softdelete', :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
