require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it "must have a price, quality and expiration_date to be valid" do
    purchase = build :purchase
    expect(purchase).to be_valid
  end

  it "is not valid if is missing a price or a quality" do
    purchase1 = build :purchase, price: nil
    purchase2 = build :purchase, quality: nil
    expect(purchase1).not_to be_valid
    expect(purchase2).not_to be_valid
  end

  it "is setting experiration_date in 2 days" do
    @datetime_now = DateTime.parse("2000-01-01 00:00:00 UTC")
    DateTime.stub(:now).and_return(@datetime_now)

    purchase = create :purchase
    expect(purchase.expiration_date).to eql(DateTime.now + 2.days)
  end

end
