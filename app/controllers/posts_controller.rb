class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new, :create]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    
  	if @post.save
      flash[:success] = 'Post created successfully'
  		redirect_to posts_path
  	else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
  		redirect_to @post
  	else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
  		render 'edit'
  	end
  end

  def destroy
  	if @post.destroy
      flash[:notice] = 'Post deleted successfully'
  		redirect_to posts_path
  	end
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :description, :photo)
  end
end
