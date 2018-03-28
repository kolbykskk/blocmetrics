# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  pw = FFaker::Internet.password
  user = User.new
  user.email = FFaker::Internet.email
  user.password = pw
  user.password_confirmation = pw
  user.confirmed_at = Date.today
  user.save!
end

1.times do
  user = User.new
  user.email = "kolbykalafut@gmail.com"
  user.password = "password"
  user.password_confirmation = "password"
  user.confirmed_at = Date.today
  user.save!
end

users = User.all

50.times do
  registered_application = RegisteredApplication.new
  registered_application.name = FFaker::Internet.unique.domain_word
  registered_application.URL = FFaker::Internet.unique.http_url
  registered_application.user = users.sample
  registered_application.save!
end

registered_applications = RegisteredApplication.all

500.times do
  event = Event.new
  event.name = ["Click", "Up-Arrow", "Esc"].sample
  event.registered_application = registered_applications.sample
  event.save!
end
