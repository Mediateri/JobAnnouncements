Rails.application.routes.draw do
  
  root 'announcements#index'
  resources :sessions
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :announcements do
    resources :comments
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
