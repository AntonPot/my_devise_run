pause = 0

num_of_all_users = rand(9..17)
num_of_all_surveys = rand(15..30)
num_of_users_who_had_taken_a_survey = num_of_all_users / rand(1..4)
possible_answers = ['Yes','No','Maybe']

# Variables value is randomly definded
surveys_created = 0
def space num
  " " * num
end

def make_a pause
  sleep(pause)
end

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
  u.surveys.new(title: Faker::Hacker.adjective.capitalize)
  surveys_created += 1 if u.save
end
puts "#{surveys_created} surveys created"
puts

Survey.all.each do |s|
  num_of_questions_per_survey = rand(1..8)
  num_of_questions_per_survey.times do
    s.questions.create(question: Faker::Hacker.say_something_smart.capitalize)
  end
  puts "Survey with id #{s.id} has #{num_of_questions_per_survey} questions"
end
puts

possible_answers.each do |a|
  Answer.create(answer: a)
  puts "Answer #{a} created"
end
puts

User.all.sample(num_of_users_who_had_taken_a_survey).each do |u|
  surveys_taken_by_a_user = rand(1..Survey.all.length)
  surveys_taken_by_a_user.times do
    r = Response.new
    u.responses << r
    Survey.all.sample.responses << r
  end
  puts "#{u.first_name} #{u.last_name} took #{surveys_taken_by_a_user} surveys"
end
puts

Response.all.each do |r|
  r.survey.questions.each do |q|
    a = AnsweredQuestion.new
    a.answer = Answer.all.sample
    a.question = q
    r.answered_questions << a
  end
end

User.all.each do |u|
  puts "#{u.first_name} #{u.last_name} took the following surveys:" if !u.surveys.empty?
  u.responses.each_with_index do |r,i|
    puts space(2) + "#{(i+1).to_s}. titled: #{r.survey.title}"
    puts space(2) + "This survey has #{r.survey.questions.length} questions:"
    r.answered_questions
    r.answered_questions.each do |aq|
      puts space(4) + "Question: #{aq.question.question}"
      puts space(4) + "User answered: #{aq.answer.answer}"
    end
    puts
    make_a pause
  end
  puts
  make_a pause
end