require 'faker'

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

50.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
wikis = Wiki.all

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

#create another standard user
standardtwo = User.new(
  name: 'Standardtwo User',
  email: 'standardtwo@example.com',
  password: 'helloworld',
  role: 'standard'
  )
standardtwo.skip_confirmation!
standardtwo.save!

#create premium user
premium = User.new(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
  )
premium.skip_confirmation!
premium.save!

premiumtwo = User.new(
  name: 'Premiumtwo User',
  email: 'premiumtwo@example.com',
  password: 'helloworld',
  role: 'premium'
  )
premiumtwo.skip_confirmation!
premiumtwo.save!

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
