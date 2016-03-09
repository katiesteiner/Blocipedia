require 'faker'

50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
wikis = Wiki.all

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
user.skip_confirmation!
user.save!
end
users = User.all

#create an admin
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

#create standard user
standard = User.new(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'helloworld',
  role: 'standard'
  )
standard.skip_confirmation!
standard.save!

#create premium user
premium = User.new(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
  )
premium.skip_confirmation!
premium.save!


puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
