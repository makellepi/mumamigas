require 'faker'

User.destroy_all
Match.destroy_all


p "Clean DB"

def round_to_5_minutes(t)
  rounded = Time.at((t.to_time.to_i / 300.0).round * 300)
  t.is_a?(DateTime) ? rounded.to_datetime : rounded
end

users = []


userMarta = User.create(
  first_name: "Marta",
  second_name: "Keller",
  email: "martatest7@hotmail.com",
  password: "test123",
  remote_photo_url: "http://res.cloudinary.com/dj70a4jbi/image/upload/c_scale,w_800/v1523030894/c1feu1qwzgnztnsgjkho.jpg",
  language: "english",
  children: Faker::Number.between(1, 3),
  children_age: Faker::Number.between(0, 5),
  age: Faker::Number.between(25, 40),
  work_status: true,
  )


userJoana = User.create(
  first_name: "Joana",
  second_name: "Banana",
  email: "joanabananatest7@hotmail.com",
  password: "test123",
  remote_photo_url: "http://rochellerice.com/wp-content/uploads/Cathey-Armillas_headshot-small.jpg",
  language: "english",
  children: Faker::Number.between(1, 3),
  children_age: Faker::Number.between(0, 5),
  age: Faker::Number.between(25, 40),
  work_status: true,
  )

p "Created admin users"

10.times do
  languages = ["Spanish", "English", "German", "French", "Portuguese", "Chinese", "Russian", "Italian"].sample
  categories = [ "Food", "Mindfullness", "Sports", "Parenting", "Yoga", "Tech", "Reading", "Shopping", "Childcare"].sample
  cities = ["Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid"].sample
  remote_photo_url = UiFaces.woman('epic')
  pregnant = [true,false].sample
  if pregnant
    pregnantdue = Date.today + rand(1..250)
  else
    pregnantdue = nil
  end
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
    city: cities,
    bio: Faker::Lorem.paragraphs(4),
    pregnant: pregnant,
    pregnantdue: pregnantdue,

    )
  users << user
  user.save!
end

p "Created users"

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

p "Created categories"


matches = []

10.times do |i|
   friend_status = %w(pending accepted declined).sample
  match = Match.new(
    user: users.sample,
    status: true,
    friend_status: friend_status,
    )
    matches << match
    match.save!
end

p "Created matches"

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

p "Created messages"

activities = []

10.times do |i|
  activity_description = ["Lorem impsum Lorem impsumLorem impsumLorem impsumLorem impsumLorem impsumLorem impsum"]
  cities = ["Rome", "Lisbon", "London", "Milan", "Madrid", "Rome", "Lisbon", "London", "Milan", "Madrid"].sample
  time = Time.now + rand(1..250)
  activity = Activity.new(
    user: users.sample,
    description: activity_description,
    location: cities,
    date: Faker::Date.forward(23),
    time: time,
    )
    activities << activity
    activity.save!
end

p "Created activities"

p "Seeded"

