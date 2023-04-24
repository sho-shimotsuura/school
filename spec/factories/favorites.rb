FactoryBot.define do
  factory :favorite do
    association :school
    association :user
  end
end
