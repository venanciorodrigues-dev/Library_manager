# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }

    # Se o seu User usa Devise :confirmable, descomente a linha abaixo
    # confirmed_at { Time.current }
  end
end
