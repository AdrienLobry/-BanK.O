class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
