Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'announcements#index'
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :announcements do
    resources :comments
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
