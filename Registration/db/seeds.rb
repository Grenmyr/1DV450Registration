# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user =User.create(
    username: 'David',
    email: 'dg222cs@student.lnu.se',
    password: 'hemligt',
    password_confirmation: 'hemligt',
)

api = Api.create(key: "testkeydnsalkdnjasdsHJDJSJD13215&")

api.user = user

api.save

user2 =User.create(
    username: 'Admin',
    email: 'admin@admin.com',
    admin: true,
    password: 'Password',
    password_confirmation: 'Password',
)

api2 = Api.create(key: "testkeydnsalkdnjasdsHJDJSJD13215&")

api2.user = user2

api2.save

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
