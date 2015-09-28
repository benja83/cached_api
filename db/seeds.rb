# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
YEAR_OPTION = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015]


User.create email: 'test@example.com'

(1..5).each { |e|  Content.create plot: "Rambo#{e} is a nice film", title: "Rambo#{e}", year: YEAR_OPTION.sample }
(1..5).each { |e|  Movie.create plot: "Rocki#{e} is a nice film", title: "Rocki#{e}", year: YEAR_OPTION.sample }
(1..rand(10)).each do |e|
  season = Season.create(
    plot: "Walking dead season #{e} is a nice serie",
    title: "Walking dead season#{e}",
    year: YEAR_OPTION.sample
  )
  (1..rand(10)).each do |n|
    episode = Episode.create(
      plot: "Walking dead season #{e} episode #{n} is a nice episode",
      title: "Walking dead season#{e} episode #{n}",
      number: n,
      season_id: season.id
    )
  end

end


