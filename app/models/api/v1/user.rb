module Api
  module V1
    class User < ActiveRecord::Base
      validates :email, presence: true, uniqueness: true, email: true
    end
  end
end

