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
    member do
      put 'like' => 'announcements#vote'
      put 'likes' => 'announcements#upvote'
      put 'unlike' => 'announcements#downvote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
