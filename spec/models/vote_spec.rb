require 'spec_helper'

describe Vote do
  describe "up and down votes" do
  before :each do
    @v_up = Vote.new(value: 1)
    @v_down = Vote.new(value: -1)
  end

  describe "up#vote" do # This is just a naming convention - used to describe the method tested
    it "returns true for an up vote" do # Describing the output or intended action
      @v_up.up_vote?.should be_true # call the method on instance and what it should evalauate to
    end
    it "returns false for a down vote" do
      @v_down.up_vote?.should be_false
    end  
  end

  describe "down#vote" do
    it "returns true for a down vote" do
      @v_down.down_vote?.should be_true
    end
    it "returns false for an up vote" do
      @v_up.down_vote?.should be_false
    end
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




