FactoryGirl.define do
  factory :user do
    name 'Joe User'
    sequence(:email) { |n| "joe#{n}@example.com"}
    password 'password'  
    confirmed_at Time.now
  end
end