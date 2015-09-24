FactoryGirl.define do
  factory :content do
    sequence(:plot) { |n| "Rambo#{n} is a nice film" }
    sequence(:title) { |n| "Rambo#{n}" }
  end
end
