FactoryGirl.define do

  sequence(:plot) { |n| "Rambo#{n} is a nice film" }
  sequence(:title) { |n| "Rambo#{n}" }

  factory :content do
    plot
    title
    type 'Movie'
  end

  factory :movie, parent: :content, class: 'Movie' do
    plot
    title
    type 'Movie'
  end
end
