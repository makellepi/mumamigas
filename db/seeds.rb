require 'faker'

User.destroy_all
Interest.destroy_all
Location.destroy_all
Match.destroy_all


p "Clean DB"

def round_to_5_minutes(t)
  rounded = Time.at((t.to_time.to_i / 300.0).round * 300)
  t.is_a?(DateTime) ? rounded.to_datetime : rounded
end



10.times do

languages = ["Spanish", "English", "German", "French", "Portuguese", "Chinese", "Russian", "Italian"].sample

user = User.create(
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "xxxxxx",
    photo: UiFaces.faces,
    language: languages,
    children: Faker::Number.between(1, 3),
    children_age: Faker::Number.between(0, 5),
    age: Faker::Number.between(25, 40),
    work_status: true,
    )
user.save
end



10.times do
countries = ["Spain", "France", "England", "Ireland", "Portugal", "Germany", "Italy", "Switzerland", "Denmark", "Greece"].sample
cities =["Madrid","Lisbon", "Porto", "Barcelona", "Berlin", "Dublin", "Rome", "Zurich", "Copenhagen", "Athens"].sample
location = Location.create(
  country: countries,
  city: cities,
  )
location.save!

end






p "Seeded"

