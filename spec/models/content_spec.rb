require 'rails_helper'

RSpec.describe Content, type: :model do
  it "must have a plot, title and a type to be valid" do
    content = build :content
    expect(content).to be_valid
  end

  it "is not valid if is missing a title or a plot" do
    content1 = build :content, price: nil
    content2 = build :content, title: nil
    content3 = build :content, plot: nil
    expect(content1).not_to be_valid
    expect(content2).not_to be_valid
    expect(content3).not_to be_valid
  end
end
