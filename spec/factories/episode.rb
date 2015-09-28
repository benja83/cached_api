FactoryGirl.define do

  sequence(:number) { |n| n }

  factory :episode do
    plot
    title
    season
    number
  end
end
