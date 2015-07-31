num_of_all_users = rand(9..17)
num_of_all_surveys = rand(2..7)

num_of_all_questions = 30
num_of_questions_per_survey = 1

# Variables value is randomly definded
surveys_created = 0

num_of_all_users.times do
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

User.all.sample(num_of_all_surveys).each do |u|
  u.surveys.new(
    title: Faker::Hacker.adjective,
  )
  surveys_created += 1 if u.save
end
puts "#{surveys_created} surveys created"

# Survey.all.each





# Survey.all.each do |survey|
#   User.all.sample(rand((num_of_users/5)..num_of_all_surveys)).each do |user|
#     opinion = Opinion.create(answer: [true, false].sample)
#     survey.opinions << opinion
#     user.opinions << opinion
#   end
# end