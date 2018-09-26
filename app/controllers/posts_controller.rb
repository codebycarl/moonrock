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
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @post.update
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @post.destroy
  		redirect_to posts_path
  	end
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :description)
  end
end
