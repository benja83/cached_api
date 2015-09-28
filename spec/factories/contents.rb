YEAR_OPTION = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015]

FactoryGirl.define do

  sequence(:plot) { |n| "Rambo#{n} is a nice film" }
  sequence(:title) { |n| "Rambo#{n}" }
  sequence(:year) { YEAR_OPTION.sample }

  factory :content do
    plot
    title
    year
  end

  factory :movie, parent: :content, class: 'Movie' do
    plot
    title
    type 'Movie'
    year
  end

  factory :season, parent: :content, class: 'Season' do
    plot
    title
    type 'Season'
    year

    trait :with_episode do
      after :build do |season|
        create_list :episode, 3, :season => season
      end
    end
  end

end
