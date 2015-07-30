num_of_users = 15
num_of_surveys = 30

num_of_users.times do
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email      = Faker::Internet.free_email("#{first_name}.#{last_name}")
  password   = ['12345678','87654321'].sample
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    email: email,
    image: Faker::Avatar.image("#{first_name}_#{last_name}","65x65")
  )
  # user.email_confirmation = email
  user.password = password
  user.password_confirmation = password
  user.save
end

num_of_surveys.times do
  Survey.create(
    subject: Faker::Hacker.adjective,
    question: Faker::Hacker.say_something_smart
  )
end

Survey.all.each do |survey|
  User.all.sample(rand((num_of_users/5)..num_of_surveys)).each do |user|
    opinion = Opinion.create(answer: [true, false].sample)
    survey.opinions << opinion
    user.opinions << opinion
  end
end