class Purchase < ActiveRecord::Base
  QUALITIES = ["HD", "SD"]
  belongs_to :user
  belongs_to :content

  validates :price, :quality, :expiration_date, presence: true
  validates :quality, inclusion: { in: QUALITIES,
    message: "%{value} is not a valid quality" }

  before_validation :set_expiration_date, on: :create

  private

    def set_expiration_date
      self.expiration_date = DateTime.now + 2.days
    end
end
