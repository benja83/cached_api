FactoryGirl.define do
  factory :purchase do
    quality "HD"
    price "1.99"
    association :user, :factory => :user
    association :content, :factory => :content,
      :title => "Content",
      :plot => "it's a nice content"

    trait :invalid_purchase do
      price nil
      quality nil
    end
  end


end
