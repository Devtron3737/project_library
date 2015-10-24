# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  user_id    :integer
#

class ContactShare < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => :contact_id

  belongs_to(
    :contact,
    class_name: "Contact",
    primary_key: :id,
    foreign_key: :contact_id
  )

  belongs_to(
    :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )
end
