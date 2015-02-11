# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Faker to populate database
5.times do |n|
  name  = Faker::Name.name
  number = n
  event =Event.create(
      name: 'Kantarell',
      edible: true,
      amount: number
  )
  event.save

  Creator.create!(name:  name, submits: number , events_id: event.id)

end

