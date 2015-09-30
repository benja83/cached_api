class Content < ActiveRecord::Base
  TYPES = %w( Movie Season )

  has_many :purchases

  validates :title, :plot, :year, :price, presence: true
  validates :type, inclusion: { in: TYPES,
    message: "%{value} is not a valid type" }, :allow_nil => true
end
