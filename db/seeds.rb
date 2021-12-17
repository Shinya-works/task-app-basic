# coding: utf-8

User.create(name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password", 
              admin: true)
              
100.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create(name: name, email: email, password: password, password_confirmation: password)  
end
              
50.times do |n|
  name = "タスク#{n+1}"
  detail = "タスク詳細#{n+1}"
  Task.create(name: name, detail: detail, user_id: 1)
end

50.times do |n|
  name = "タスク#{n+1}"
  detail = "タスク詳細#{n+1}"
  Task.create(name: name, detail: detail, user_id: 2)
end

50.times do |n|
  name = "タスク#{n+1}"
  detail = "タスク詳細#{n+1}"
  Task.create(name: name, detail: detail, user_id: 3)
end