class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.text :plot
      t.string :title
      t.integer :number
    end
  end
end
