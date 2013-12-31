class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :post

  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true 

  after_create :send_favorite_emails  # after the comment has been created = saved in the db, call this method

  private 

  def send_favorite_emails
    self.post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
    end
  end
end
