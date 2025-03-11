class RemoveAdressToRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :adress
    add_column :restaurants, :address, :string
  end
end
