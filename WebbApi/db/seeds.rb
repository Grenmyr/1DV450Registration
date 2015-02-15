# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Faker to populate database
mushrooms = [{name:'Kantarell', edible: true, amount: 4},{name:'Carl Johan', edible: true, amount: 5},
             {name:'Flugsvamp', edible: false, amount: 2},{name:'flugsopp', edible: false, amount: 1},
             {name:'Trattkantarell', edible: true, amount: 5}]
5.times do |n|
  name  = Faker::Name.name
  number = n
  event =Event.create(
      name: mushrooms[n][:name],
      edible: mushrooms[n][:edible],
      amount: mushrooms[n][:amount]
  )
  event.save

  Creator.create(name:  name, submits: number , event_id: event.id)
  lat = Faker::Address.latitude
  long = Faker::Address.longitude
  Position.create(lat: lat, long: long, event_id: 5-n)

end
2.times do |m|
  number = m+1*2
  tag_name = Faker::Internet.domain_word
  tag =Tag.create(tag_name: tag_name)
  EventsTag.create(event_id: number, tag_id: tag.id)
end

