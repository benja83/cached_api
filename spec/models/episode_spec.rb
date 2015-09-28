require 'rails_helper'

RSpec.describe Episode, type: :model do
  it "must have an plot, title and a number to be valid" do
    content = build :episode
    expect(content).to be_valid
  end

  it "is unvalid if is missing a title or a plot" do
    content1 = Episode.new plot: 'This a plot'
    content2 = Episode.new title: "This is the title"
    expect(content1).not_to be_valid
    expect(content2).not_to be_valid
  end

  it "must belongs to a season" do
    content = build :episode
    expect(content.season_id).to eql(Season.last.id)
  end

end
