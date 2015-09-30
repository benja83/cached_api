class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.string :quality
      t.datetime :expiration_date

      t.timestamps null: false
    end
  end
end
