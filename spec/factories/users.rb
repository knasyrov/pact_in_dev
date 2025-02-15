FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    patronymic { Faker::Name.middle_name }
    surname { Faker::Name.last_name }
    gender { Faker::Gender.binary_type.downcase }
    age { rand(90) }
    nationality { Faker::Nation.nationality }
    country { Faker::Address.country } 
  end
end
