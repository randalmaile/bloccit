class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    @new_comment = Comment.new
    
    authorize! :create, @comment, message: "You need be signed in to do that."

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
  end
end
