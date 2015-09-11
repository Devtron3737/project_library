# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

craiger = User.create!(user_name: "craiger")
barbra = User.create!(user_name: "barbra")
chod = User.create!(user_name: "chod")
jarrid = User.create!(user_name: "jarrid")
marina = User.create!(user_name: "marina")

poll1 = Poll.create!(title: "Prop 1", author_id: craiger.id)
poll2 = Poll.create!(title: "Prop 2", author_id: barbra.id)
poll3 = Poll.create!(title: "Prop 3", author_id: chod.id)
poll4 = Poll.create!(title: "Prop 4", author_id: marina.id)

ques1 = Question.create!(text: "Apples?", poll_id: poll1.id)
ques2 = Question.create!(text: "Grapes?", poll_id: poll2.id)
ques3 = Question.create!(text: "Bananas?", poll_id: poll3.id)
ques4 = Question.create!(text: "Oranges?", poll_id: poll4.id)

AnswerChoice.create!(text: "Yes!", question_id: ques1.id)
AnswerChoice.create!(text: "No!", question_id: ques1.id)
AnswerChoice.create!(text: "Right!", question_id: ques2.id)
AnswerChoice.create!(text: "Ewwww!", question_id: ques2.id)
AnswerChoice.create!(text: "Ok!", question_id: ques3.id)
AnswerChoice.create!(text: "No Way", question_id: ques3.id)
AnswerChoice.create!(text: "Y!", question_id: ques4.id)
AnswerChoice.create!(text: "N!", question_id: ques4.id)
