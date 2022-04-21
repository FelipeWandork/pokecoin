Rails.application.routes.draw do
  resources :pokemons
  resources :wallets
#  get 'historic/write'
  get 'historic/read'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
