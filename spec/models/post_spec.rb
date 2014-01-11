require 'spec_helper'

describe Post do 
  describe "@up_votes" do 
    it "returns an up_vote count of 1 if post just created and never voted on" do 
      p = create(:post)
      p.up_votes.should eq(1)
    end

    it "returns an up_vote count of 2 if post was voted up by user" do 
      
      ## Started with this code
        # Post.skip_callback(:create,:after,:create_vote)
        # u = User.new
        # p = u.posts.new
        # p.save(validate: false)
        # Vote.create(value: 1, post: p)  
        # p.up_votes.should eq(1)

      ## Next created user, topic and valid post instances
        # u1 = create(:user)
        # t = create(:topic)
        # p = u1.posts.create(title: "sfsdfd", body: "sfd sdf sfs df ssdfsdfsd sdf fsdf", topic: t)
      
      ## finally just used the factory ONLY for the post
      p = create(:post)
      u2 = create(:user)
      u2.votes.create(value: 1, post: p)
      p.up_votes.should eq(2)
    end
  end 

  describe "@points" do 
    it "returns sum of all votes - either up or down" do 
      Post.skip_callback(:create,:after,:create_vote)
      p = create(:post)
      3.times do
        Vote.create(value: 1, post: p) 
      end
      p.up_votes.should eq(3)
    end
  end 
end  