Rails.application.routes.draw do
  devise_for :users
  resources :lists do
    resources :items
  end

  put '/lists/:list_id/items/:id/mark', to: 'items#mark'
  put '/lists/:list_id/items/:id/unmark', to: 'items#unmark'

  root 'welcome#index'
end
