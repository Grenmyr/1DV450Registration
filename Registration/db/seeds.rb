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

positions =[[56.52186427798517,15.534125890624978],
 [57.0514245695495,16.116401281249978],
[56.455142710571536,15.863715734374978],
[56.70323643846532,15.929633703124978],
[56.72132576744785,15.039741124999978],
[56.35179660926256,14.973823156249978],
[56.35179660926256,14.973823156249978],
[56.93772001326552,15.138618078124978],
[56.78156073069479,16.127387609374978],
[56.54004070987818,15.929633703124978],
[56.75747833606965,16.039496984374978]]



mushrooms = [{name:'Kantarell', edible: true, taste: 5},{name:'Carl Johan', edible: true, taste: 5},
             {name:'Flugsvamp', edible: false, taste: 1},{name:'flugsopp', edible: false, taste: 1},
             {name:'Trattkantarell', edible: true, taste: 4}]
berries = [{name:'Rönnbär', edible: true, taste: 2},{name:'Vilda körsbär', edible: true, taste: 3},
             {name:'Dödsbäret', edible: false, taste: 1},{name:'Hallon', edible: true, taste: 5},
             {name:'Blåbär', edible: true, taste: 4}]
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
      creator_id: 1+rand(3)
  )

  Type.create(name: types[n][:name])

  david =Creator.create(
      name: 'david Grenmyr',
      submits: 8,
      password: 'hemligt',
      password_confirmation: 'hemligt',
  )

  Creator.create(name:  name, submits: number ,
                 password: 'password',password_confirmation: 'password',)
   Position.create(lat: positions[rand(10)][0], lng: positions[rand(10)][1], amount:1+rand(5), event_id: 5-n, creator_id:1+rand(5))

end

20.times do
  lat = 55 + rand(3)
  lng = 15 + rand(3)
  pos = Position.new(lat: positions[rand(10)][0], lng: positions[rand(10)][1], amount: 1+rand(5), event_id: 1 + rand(10), creator_id:1+rand(5))
  pos.save
end


5.times do |m|
  number = m+1
  event = Event.find(number)

  type = Type.find(1)
  type.events << event
  type.save
end



5.times do |n|
  event =Event.new(
      name: berries[n][:name],
      edible: berries[n][:edible],
      taste: berries[n][:taste],
      creator_id: 2
  )
  event.save
end

5.times do |l|
  number = l+6
  event = Event.find(number)

  type = Type.find(2)
  type.events << event
  type.save
end







