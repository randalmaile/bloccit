 require 'spec_helper'
 require 'pry'

describe User do

  describe ".top_rated" do
    before :each do
      post = nil
      topic = create(:topic)
      @u0 = create(:user) do |user|
        5.times do  
          post = user.posts.build(attributes_for(:post))
          post.topic = topic
          post.save
        end
        2.times do
          c = user.comments.build(attributes_for(:comment))
          c.post = post
          c.save
        end
      end

      @u1 = create(:user) do |user|
        3.times do
          post = user.posts.build(attributes_for(:post))
          post.topic = topic
          post.save
        end
        3.times do
          c = user.comments.build(attributes_for(:comment))
          c.post = post
          c.save
        end
      end
    end

    it "should return users based on comments + posts" do
      User.top_rated.should eq([@u0, @u1])
    end
    it "should have `posts_count` on user" do
      users = User.top_rated
      users.first.posts_count.should eq(5)
    end
    it "should have `comments_count` on user" do
      users = User.top_rated
      users.first.comments_count.should eq(2)
    end
  end

end