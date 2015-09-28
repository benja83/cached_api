class Content < ActiveRecord::Base
  TYPES = %w( Movie Season )
  validates :title, :plot, :year, presence: true
  validates :type, inclusion: { in: TYPES,
    message: "%{value} is not a valid type" }, :allow_nil => true

  def as_json(options={})
    super(options.merge({:methods => [:type, :episodes]}))
  end

end
