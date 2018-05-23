require 'faker'

User.destroy_all
Location.destroy_all
Match.destroy_all


p "Clean DB"

def round_to_5_minutes(t)
  rounded = Time.at((t.to_time.to_i / 300.0).round * 300)
  t.is_a?(DateTime) ? rounded.to_datetime : rounded
end

users = []

10.times do
  languages = ["Spanish", "English", "German", "French", "Portuguese", "Chinese", "Russian", "Italian"].sample
  categories = [ "Food", "Mindfullness", "Sports", "Parenting", "Yoga", "Tech", "Reading", "Shopping", "Childcare"].sample
  remote_photo_url = UiFaces.woman
  user = User.create(
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "xxxxxx",
    remote_photo_url: remote_photo_url,
    language: languages,
    children: Faker::Number.between(1, 3),
    children_age: Faker::Number.between(0, 5),
    age: Faker::Number.between(25, 40),
    work_status: true,
    interest_category: categories,
    )
  users << user
  user.save!
end

interests_users = []

 10.times do |i|
    categories = [ "Special needs", "Playing dates", "Food", "Tech", "Relaxed Parenting", "Mindfullness", "Others", "Fitness", "Party Animal", "Sole parent"]
    interest = Interest.new(
    category: categories.sample,
    user: users.sample,
    )
    interests_users << interest
    interest.save!
end


locations = []

cities = ["Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid"]

(0...10).each do |i|
  location = Location.new(
    city: cities[i],
    user: users.sample
    )
    locations << location
    location.save!
  end

matches = []

10.times do |i|
   friend_status = %w(pending accepted declined).sample
  match = Match.new(
    location: locations.sample,
    user: users.sample,
    status: true,
    friend_status: friend_status,
    )
    matches << match
    match.save!
end

p "Almost there"

messages = []

10.times do |i|
  message_content = ["Let's be friends"]
  message = Message.new(
    match: matches.sample,
    user: users.sample,
    content: message_content,
    )
    messages << message
    message.save!
end


  p "Seeded"

