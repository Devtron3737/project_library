# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ActiveRecord::Base
  #Write out the verbose options
  belongs_to(
   :question,
   class_name: "Question",
   foreign_key: :question_id,
   primary_key: :id
   )

  has_one(
    :response,
    class_name: "Response",
    foreign_key: :answer_choice_id,
    primary_key: :id
    )

end
