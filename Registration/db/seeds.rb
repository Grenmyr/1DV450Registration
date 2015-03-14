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
mushrooms = [{name:'Kantarell', edible: true, taste: 5},{name:'Carl Johan', edible: true, taste: 5},
             {name:'Flugsvamp', edible: false, taste: 1},{name:'flugsopp', edible: false, taste: 1},
             {name:'Trattkantarell', edible: true, taste: 4}]
types = [{name:'Svamp'},{name:'Bär'},
         {name:'Rötter'},{name:'Frukt'},
         {name:'Övrigt'}]
5.times do |n|
  name  = Faker::Name.name
  number = n
  event =Event.create(
      name: mushrooms[n][:name],
      edible: mushrooms[n][:edible],
      taste: mushrooms[n][:taste],
      creator_id: n
  )
  type = Type.create(name: types[n][:name])
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
   Position.create(lat: lat, lng: lng, amount:1+rand(5), event_id: 5-n)

end

100.times do
  lat = 52 + rand(5)
  lng = 13 + rand(5)
  pos = Position.new(lat: lat, lng: lng, amount: 1+rand(5), event_id: 1 + rand(5))
  pos.save
end


2.times do |m|
  number = m+2
  event = Event.find(number)

  type = Type.find(1)
  type.events << event
  type.save
  #EventsTag.create(event_id: number, tag_id: tag.id)
end


