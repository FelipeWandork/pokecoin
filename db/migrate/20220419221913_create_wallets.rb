class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.text :user
      t.float :satoshi
      t.float :dollar

      t.timestamps
    end
  end
end
