class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :question, :user, :body
end