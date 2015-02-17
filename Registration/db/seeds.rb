# SEEDS FOR REGISTRATION APP
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

# SEEDS FOR API APP
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
  type = Type.create(name: 'Svampar')
  event.types << type
  event.save

  Creator.create(name:  name, submits: number , event_id: event.id)
  lat = Faker::Address.latitude
  long = Faker::Address.longitude
  Position.create(lat: lat, long: long, event_id: 5-n)

end
2.times do |m|
  number = m+1*2
  event = Event.find(number)
  name = Faker::Internet.domain_word
  type =Type.new(name: name)
  type.events << event
  type.save
  #EventsTag.create(event_id: number, tag_id: tag.id)
end
