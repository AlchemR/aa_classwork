Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users #plural resources plural users
  resource :session, only: [:create, :destroy, :new] #single resource, single session
  resources :subs, except: [:destroy] do 
    resources :posts, only: [:create, :new]
  end 
  resources :posts, except: [:index]
end
