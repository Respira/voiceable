User.destroy_all
Recording.destroy_all

User.create!({
  email: "jordi@voiceable.io",
  password: "password10",
  admin: true
  })
  
file = File.read('lib/examples/json/example1.json')

1.times do
  Recording.create!({
    data: file,
    description: Faker::ChuckNorris.fact,
    user: User.first
    })
end 

file = File.read('lib/examples/json/example2.json')

1.times do
  Recording.create!({
    data: file,
    description: Faker::ChuckNorris.fact,
    user: User.first
    })
end 