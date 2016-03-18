FactoryGirl.define do
  factory :user do
    name 'Joe User'
    sequence(:email) { |n| "joe#{n}@example.com"}
    password 'password'
    confirmed_at Time.now
    # trait :admin do
    #   first_name 'Joe'
    #   last_name 'Admin'
    #   email 'admin@omoido.com'
    #   admin true
    #   password 'password'
    # end
  end
end
