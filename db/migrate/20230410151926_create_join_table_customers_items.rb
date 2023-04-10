class CreateJoinTableCustomersItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :items do |t|
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end