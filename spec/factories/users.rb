FactoryBot.define do
  factory :user do
    name { "User1" }
    email { "a@gmail.com" }
    password { "password1" }
    password_confirmation { "password1" }
    admin { false }
    trait :general do
      role { 'general' }
    end
  end

  factory :user2, class: User do
    name { 'User2' }
    email { 'b@gmail.com' }
    password { "password2" }
    password_confirmation { "password2" }
    admin { true }
    trait :executive do
      role { 'executive' }
    end
  end

  factory :user3 , class: User do
    name { "User3" }
    email { "c@gmail.com" }
    password { "password3" }
    password_confirmation { "password3" }
    admin { false }
    trait :general do
      role { 'general' }
    end
  end
end
