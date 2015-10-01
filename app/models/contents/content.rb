class Content < ActiveRecord::Base
  alias :read_attribute_for_serialization :send

  TYPES = %w( Movie Season )

  has_many :purchases

  validates :title, :plot, :year, :price, presence: true
  validates :type, inclusion: { in: TYPES,
    message: "%{value} is not a valid type" }, :allow_nil => true
end
