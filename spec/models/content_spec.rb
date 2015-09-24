require 'rails_helper'

RSpec.describe Content, type: :model do
  it "must have an plot and a tilte to be valid" do
    content = build :content
    expect(content).to be_valid
  end

  it "is unvalid if is missing a tilte or a plot" do
    content1 = Content.new plot: 'This a plot'
    content2 = Content.new title: "This is the title"
    expect(content1).not_to be_valid
    expect(content2).not_to be_valid
  end
end
