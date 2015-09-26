FactoryGirl.define do

  sequence(:plot) { |n| "Rambo#{n} is a nice film" }
  sequence(:title) { |n| "Rambo#{n}" }

  factory :content do
    plot
    title
  end

  factory :movie, parent: :content, class: 'Movie' do
    plot
    title
    type 'Movie'
  end

  factory :season, parent: :content, class: 'Season' do
    plot
    title
    type 'Season'
  end

end
