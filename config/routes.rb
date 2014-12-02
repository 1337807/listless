Rails.application.routes.draw do
  get 'items/index'

  get 'items/new'

  get 'items/create'

  get 'items/show'

  devise_for :users
  resources :lists do
    resources :items
  end
  root 'welcome#index'
end
