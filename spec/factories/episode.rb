FactoryGirl.define do

  sequence(:number) { |n| n }

  factory :episode do
    plot
    title
    association :season, :factory => :season, :title => "The walking dead"
    number
  end
end
