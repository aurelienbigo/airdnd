Rails.application.routes.draw do
  get 'reservations/index'

  get 'reservations/show'

  get 'reservations/new'

  get 'reservations/create'

  get 'reservations/edit'

  get 'reservations/update'

  get 'reservations/destroy'

  get 'profiles/index'

  get 'profiles/show'

  get 'profiles/new'

  get 'profiles/create'

  get 'profiles/edit'

  get 'profiles/update'

  get 'profiles/destroy'

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
