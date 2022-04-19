class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :order
      t.string :name
      t.string :base_experience
      t.string :value_satoshi
      t.string :value_dolar

      t.timestamps
    end
  end
end
