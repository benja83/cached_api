require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have an email to be valid" do
    user = build(:user)
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
    create(:user)
    user = build(:user)
    expect(user).not_to be_valid
  end
end
