FactoryBot.define do
  factory :school do
    name { 'test_name' }
    prefecture {'test_prefecture'}
    city {'test_city'}
    phone {'000111222'}
    overview {'test_overview'}
    

    after(:build) do |school|
      school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end

  factory :second_school,class: School do
    name { 'test_name2' }
    prefecture {'test_prefecture'}
    city {'test_city'}
    phone {'000333444'}
    overview {'test_overview'}
    
    after(:build) do |school|
      school.image.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end
