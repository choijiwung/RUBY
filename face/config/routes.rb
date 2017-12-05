Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get 'create_comment'
    end
  end

  root 'posts#index'

  get 'posts/:id/create_comment' => 'posts#create_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
