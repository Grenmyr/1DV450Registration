# SEEDS FOR REGISTRATION APP
user =User.create(
    username: 'David',
    email: 'dg222cs@student.lnu.se',
    password: 'hemligt',
    password_confirmation: 'hemligt',
)

api = Api.create(key: "123")

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
      amount: mushrooms[n][:amount],
      creator_id: n
  )
  type = Type.create(name: 'Svamp')
  event.types << type
  event.save

  david =Creator.create(
      name: 'david Grenmyr',
      submits: 8,
      password: 'hemligt',
      password_confirmation: 'hemligt',
  )

  Creator.create(name:  name, submits: number ,
                 password: 'password',password_confirmation: 'password',)
   lat = Faker::Address.latitude
   lng = Faker::Address.longitude
   Position.create(lat: lat, lng: lng, event_id: 5-n)

end

20.times do
  lat = 50 + rand(15)
  lng = 10 + rand(15)
  pos = Position.new(lat: lat, lng: lng, event_id: 1 + rand(5))
  pos.save
end

2.times do |m|
  number = m+1
  event = Event.find(number)
  name = Faker::Internet.domain_word
  type =Type.new(name: name)
  type.events << event
  type.save
  #EventsTag.create(event_id: number, tag_id: tag.id)
end

