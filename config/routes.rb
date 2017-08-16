Rails.application.routes.draw do
  resources :profiles, except: [:destroy] do
    resources :skill_lvls, only: [:create, :edit, :destroy]
    resources :reviews, except: [:destroy, :edit]
    resources :reservations, only: [:create, :new]
  end
  resources :reservations, except: [:create, :new]

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end

