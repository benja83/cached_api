require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have an email to be valid" do
    user = build :user
    expect(user).to be_valid
  end

  it "is not valid if it don't have email" do
    user = build :user, email: nil
    expect(user).not_to be_valid
  end

  it "is not valid if it have un wrong email" do
    user = build :user, email: 'test@example'
    expect(user).not_to be_valid
  end

  it "must have unique email" do
    user1 = create(:user)
    user2 = build(:user, :email => user1.email)
    expect(user2).not_to be_valid
  end
end
