class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.references :supermarket
      t.references :customer
      t.timestamps
    end
  end
end
