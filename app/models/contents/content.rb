class Content < ActiveRecord::Base
  TYPES = %w( Movie )
  validates :title, :plot, :type, presence: true
  validates :type, inclusion: { in: TYPES,
    message: "%{value} is not a valid type" }

  def as_json(options={})
    super(options.merge({:methods => :type}))
  end
end
