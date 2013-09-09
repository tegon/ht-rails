class Category < ActiveRecord::Base
  has_many :questions

  validates_presence_of :name

  scope :sorted_by_name, order("name asc")
end