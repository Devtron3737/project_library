# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  submitter_id :integer
#  long_url     :string
#  short_url    :string
#  created_at   :datetime
#  updated_at   :datetime
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true

  belongs_to(
    :submitter,
    class_name: "User",
    primary_key: :id,
    foreign_key: :submitter_id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor
  )

  def self.random_code
    short_url = SecureRandom.urlsafe_base64(12)
    while ShortenedUrl.exists?(:short_url => short_url)
      short_url = SecureRandom.urlsafe_base64(12)
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    new_short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(submitter_id: user.id, long_url: long_url, short_url: new_short_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    time_limit = 10.minutes.ago
    self.visits.select("user_id").where(["created_at > ?", time_limit]).distinct.count
  end
end
