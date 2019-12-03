FactoryGirl.define do
  factory :user do
    name 'Dummy User'
    username 'dummy-user'
    sequence(:email) { |i| "dummy.user-#{i}@gmail.com" }
  end
end