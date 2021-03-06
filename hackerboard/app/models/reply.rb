class Reply < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :question, counter_cache: true

  validates_presence_of :question, :user, :body

  scope :to_feed, includes(:user).limit(10).order("id desc")
end