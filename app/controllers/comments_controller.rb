class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    # what do we need to create a new comment and associate it with a particuar user and post and topic
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    @comments = @post.comments
    if @comment.save
      flash[:notice] = "Your comment was saved!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem saving the post."
      render 'topics/posts/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize! :destroy, @comment, message: "You need to own the comment to delete it."
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again!"
    end

    respond_with(@comment) do |f|
        f.html { redirect_to [@topic, @post] }
    end
  end
end
