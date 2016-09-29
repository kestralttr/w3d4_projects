# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(user_name: 'Alex')
User.create!(user_name: 'Brian')
Poll.create!(title: "Hours at a/a", author_id: 1)
Question.create!(text: "How many hours do you spend at a/a per week?", poll_id: 1)
Question.create!(text: "How many hours do you spend studying on your own per week?", poll_id: 1)
Question.create!(text: "How many hours do you sleep?", poll_id: 1)
AnswerChoice.create!(answer: "0 to 1", question_id: 1)
AnswerChoice.create!(answer: "2 to 5", question_id: 1)
AnswerChoice.create!(answer: "5+", question_id: 1)
AnswerChoice.create!(answer: "0 to 1", question_id: 2)
AnswerChoice.create!(answer: "2 to 5", question_id: 2)
AnswerChoice.create!(answer: "5+", question_id: 2)
AnswerChoice.create!(answer: "0 to 1", question_id: 3)
AnswerChoice.create!(answer: "2 to 5", question_id: 3)
AnswerChoice.create!(answer: "5+", question_id: 3)
Response.create!(user_id: 2, answer_choice_id: 3)
Response.create!(user_id: 2, answer_choice_id: 6)
Response.create!(user_id: 2, answer_choice_id: 8)
