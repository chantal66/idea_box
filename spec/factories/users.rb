FactoryGirl.define do
  factory :user do
    username
    email
    password 'password'
  end

  sequence :username do |n|
    "Chantal #{n}"
  end

  sequence :email do |n|
    "chantal#{n}@example.com"
  end
end
