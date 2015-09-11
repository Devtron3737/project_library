# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  belongs_to(
    :answer_choice,
    class_name:  "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )
  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one :question, through: :answer_choice, source: :question


  def sibling_responses
    self.question.responses.where("responses.id != ?", [self.id])
  end


    private
    def respondent_has_not_already_answered_question
      sibling_responses.exists?("?", self)
    end
end
