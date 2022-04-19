Rails.application.routes.draw do
  get 'historic/write'
  get 'historic/read'
  resources :pokemons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
