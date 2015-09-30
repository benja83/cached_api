class AddPriceToContent < ActiveRecord::Migration
  def change
    add_column :contents, :price, :decimal, :precision => 8, :scale => 2
  end
end
