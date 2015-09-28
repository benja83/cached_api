class AddAssociationSeasonEpisode < ActiveRecord::Migration
  def change
    add_reference :episodes, :season, index: true
  end
end
