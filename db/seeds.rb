# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password")
              
50.times do |n|
  name = "タスク#{n+1}"
  deteil = "タスク詳細"
  Task.create!( name: name, 
              deteil: deteil,
              )
end