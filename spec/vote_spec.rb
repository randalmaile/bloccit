require 'spec_helper'

describe Vote do
  describe "up#vote" do # This is just a naming convention - used to describe the method tested
    it "returns true for an up vote" do # Describing the output or intended action
      v = Vote.new(value: 1) # set up your instances
      v.up_vote?.should be_true # call the method on instance and what it should evalauate to
    end
    it "returns false for a down vote" do
      v = Vote.new(value: -1)
      v.up_vote?.should be_false
    end  
  end

  describe "down#vote" do
    it "returns true for a down vote" do
      v = Vote.new(value: -1)
      v.down_vote?.should be_true
    end
    it "returns false for an up vote" do
      v = Vote.new(value: 1)
      v.down_vote?.should be_false
    end
  end

  describe "#update_post" do
    it "calls `update_rank` on post" do

      post = create(:post)
      post.should respond_to(:update_rank)
      post.should receive(:update_rank)
      Vote.create(value: 1, post: post) 
    end
  end
end




