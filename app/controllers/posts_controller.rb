class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
      text = "post created: #{@post.title} @yarotheslav"
      TelegramMailer.send_group_message(text).deliver_now
      TelegramMailer.send_private_message(text, session[:user_id]).deliver_now
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
      text = "post updated"
      TelegramMailer.send_group_message(text).deliver_now
      user = session[:user_id]
      TelegramMailer.send_private_message(text, user).deliver_now
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
    text = "post deleted"
    TelegramMailer.send_group_message(text).deliver_now
    TelegramMailer.send_private_message(text, session[:user_id]).deliver_now
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
