# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many(
    :authored_polls,
    :class_name => "Poll",
    :foreign_key => :author_id,
    :primary_key => :id
  )

  has_many(
    :responses,  # method name
    :class_name => "Response", # child class
    :foreign_key => :user_id, # child foreign_key (my id)
    :primary_key => :id # parent (id)
  )

  # belongs_to(
  #   :responses,  # method name
  #   :class_name => "Response", # parent class
  #   :foreign_key => :user_id, # my foreign_key (parent id)
  #   :primary_key => :id # parent (id)
  # )

  has_many :questions, through: :authored_polls, source: :questions
end
