class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :post

  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true 
end
