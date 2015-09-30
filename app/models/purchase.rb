class Purchase < ActiveRecord::Base
  QUALITIES = ["HD", "SD"]
  belongs_to :user
  belongs_to :content

  validates :price, :quality, presence: true
  validates :quality, inclusion: { in: QUALITIES,
    message: "%{value} is not a valid quality" }
  validate :not_duplicated_content_in_library

  scope :library, -> { where("expiration_date >= ?", DateTime.now) }

  before_create do
    set_expiration_date if self.expiration_date.blank?
  end

  private

    def set_expiration_date
      self.expiration_date = DateTime.now + 2.days
    end

    def not_duplicated_content_in_library
      message = "This content is already present in your library"
      library_ids =  Api::V1::PurchaseService.new.current_user_library.pluck(:content_id)
      errors.add(:content_id, message) if library_ids.include?(content_id)
    end
end
