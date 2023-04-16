10.times do |n|
  User.create!(
    email: "test#{n + 1}@gmail.com",
    name: "テスト#{n + 1}",
    password: "password#{n + 1}",
    password_confirmation: "password#{n + 1}",
    admin: false
  )
end

10.times do |n|
  School.create!(
    name: "name#{n + 1}",
    prefecture: "prefecture#{n + 1}",
    city: "city#{n + 1}",
    phone: "phone#{n + 1}",
    overview: "overview#{n + 1}",
    user_id: n + 1
  )
end

10.times do |n|
  Subject.create!(
    name: "科目#{n + 1}"
  )
end

10.times do |n|
  Handling.create!(
    school_id: n + 1,
    subject_id: n + 1
  )
end
