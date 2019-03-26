Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :authors, only:[:new, :create]
    resources :reviews, only:[:new, :create]
  end

  resources :authors, only: [:show, :destroy] do
    resources :books, only: [:destroy]
  end
  
  root :to => "welcome#index"
end
