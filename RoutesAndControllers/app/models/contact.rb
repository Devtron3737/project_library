# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string
#  email   :string
#  user_id :integer
#

class Contact < ActiveRecord::Base

  validates_uniqueness_of :user_id, :scope => :email

  belongs_to(
    :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
    :contact_shares,
    class_name: "ContactShare",
    primary_key: :id,
    foreign_key: :contact_id,
    dependent: :destroy
  )

  has_many :shared_users, through: :contact_shares, source: :user

  # validates :
  # validates :username, presence: true
end
