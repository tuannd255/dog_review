User.create! name: "Admin", email: "admin@gmail.com",
  password: "12345678", password_confirmation: "12345678", is_admin: true

10.times do |n|
  name = Faker::Name.name
  email = "test#{n}@gmail.com"
  password = "12345678"
  password_confirmation = "12345678"
  User.create! name: name, email: email, password: password,
    password_confirmation: password_confirmation
end

10.times do |n|
  Category.create name: Faker::Name.name
end

Category.all.each do |category|
  User.all.each do |user|
    5.times do |n|
      Dog.create name: Faker::Name.name, weight: 20, height: 20,
        avg_life_expectancy: 10, origin: Faker::Name.name, category_id: category.id, user_id: user.id
    end
  end
end

