class AddYearToContent < ActiveRecord::Migration
  def change
    add_column :contents, :year, :integer
  end
end
