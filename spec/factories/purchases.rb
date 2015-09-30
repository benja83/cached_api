FactoryGirl.define do
  factory :purchase do
    price 1.67
    quality "HD"
    association :user, :factory => :user
    association :content, :factory => :content,
      :title => "Content",
      :plot => "it's a nice content"
  end
end
