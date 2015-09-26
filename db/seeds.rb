# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create email: 'test@example.com'

(1..5).each { |e|  Content.create plot: "Rambo#{e} is a nice film", title: "Rambo#{e}"}
(1..5).each { |e|  Movie.create plot: "Rocki#{e} is a nice film", title: "Rocki#{e}"}
(1..5).each { |e|  Season.create plot: "Walking dead season #{e} is a nice serie", title: "Walking dead season#{e}"}

