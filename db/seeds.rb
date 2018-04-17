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

remote_photo_url = UiFaces.woman
status = %w(full-time part-time leave).sample
languages = ["Spanish", "English", "German", "French", "Portuguese", "Chinese", "Russian", "Italian"].sample
user = User.create(
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    email: "#{first_name}@#{Faker::Internet.domain_name}",
    password: "xxxxxx",
    city: "Lisbon",
    photo: remote_photo_url,
    language: languages,
    children: Faker::Number.between(1, 3),
    children_age: Faker::Number.between(0, 5),
    age: Faker::Number.between(25, 40),
    working_status: status,
    )
user.save
end


categories = ["Reading", "Shopping", "Food", "Movies", "Tech"]

(0...5).each do |i|
  Interest.create(category: categories[i])
end



p "Almost there"


10.times do
  status = %w(pending accepted declined).sample
  Match.create(user: User.all.sample,location: Location.all.sample, status: status)
end

countries = ["Spain", "France", "England", "Ireland", "Portugal", "Germany", "Italy", "Switzerland", "Denmark", "Greece" ]
cities =["Madrid","Lisbon", "Porto", "Barcelona", "Berlin", "Dublin", "Rome", "Zurich", "Copenhagen", "Athens"]

(0...10).each do |i|
  Location.create(country: countries[i], city: cities[i])
end


p "Seeded"

