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
