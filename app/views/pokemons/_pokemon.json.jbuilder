json.extract! pokemon, :id, :order, :name, :base_experience, :value_satoshi, :value_dolar, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
