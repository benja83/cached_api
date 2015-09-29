class Episode < ActiveRecord::Base
  belongs_to :season
  validates :title, :plot, :number, presence: true
end

