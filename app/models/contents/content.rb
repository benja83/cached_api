class Content < ActiveRecord::Base
  validates :title, :plot, presence: true
end
