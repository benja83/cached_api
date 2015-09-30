class User < ActiveRecord::Base
  has_many :purchases

  validates :email, presence: true, uniqueness: true, email: true
end
