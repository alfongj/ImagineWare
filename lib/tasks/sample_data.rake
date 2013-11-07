namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "aime",
                 last_name:  "ngongang",
                 email: "aime@ngongang.com",
                 password: "password",
                 password_confirmation: "password")
    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "aime-#{n+1}@ngongang.com"
      password  = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
