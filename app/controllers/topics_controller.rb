class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def new
    @topic = Topic.new
    authorize! :create, @topic, message: "You need to be an admin for that."
  end

  def create
    @topic = Topic.new(params[:topic])
    authorize! :create, @topic, message: "You need to be an admin to do that."
    if @topic.save
      flash[:notice] = "Topic saved"
      redirect_to @topic
    else
      flash[:error] = "The topic entered was not saved. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to own the topic to edit it."
  end

  def update
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to own the topic to update it."
    if @topic.update_attributes(params[:topic])
      flash[:notice] = "Topic updated"
      redirect_to @topic
    else
      flash[:error] = "The topic you updated was not saved. Please try again."
      render :new
    end
  end
end
