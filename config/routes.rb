Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :cuisines, only: [:show, :new, :create]
  resources :recipe_types, only: [:show, :new, :create]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :patch, :update] do
    get 'search', on: :collection
  end
end
