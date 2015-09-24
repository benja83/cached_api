require 'rails_helper'

module Api
  module V1

    RSpec.describe User, type: :model do
      it "must have an email to be valid" do
        user = User.new email: 'test@example.com'
        expect(user).to be_valid
      end

      it "is unvalid if it don't have email" do
        user = User.new
        expect(user).not_to be_valid
      end

      it "is unvalid if it have un wrong email" do
        user = User.new email: 'test@example'
        expect(user).not_to be_valid
      end

      it "has to be unique email" do
        User.create email: 'test@example.com'
        user = User.new email: 'test@example.com'
        expect(user).not_to be_valid
      end
    end
  end
end
