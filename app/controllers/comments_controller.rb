class CommentsController < ApplicationController
  def create
    # what do we need to create a new comment and associate it with a particuar user and post and topic
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Your comment was saved!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem saving the post."
    end
  end
end
