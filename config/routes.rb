Rails.application.routes.draw do
  
  root 'pictures#top'
  
  get 'sessions/new'

  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :pictures do
    collection do
      post :confirm
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get 'list', to: :show, controller: 'users'
  resources :favorites, only: [:create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
