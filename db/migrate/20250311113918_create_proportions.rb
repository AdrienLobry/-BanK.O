class CreateProportions < ActiveRecord::Migration[7.1]
  def change
    create_table :proportions do |t|
      t.references :ingredients, null: false, foreign_key: true
      t.string :unit
      t.float :amount

      t.timestamps
    end
  end
end
