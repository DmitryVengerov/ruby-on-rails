class PostsController < ApplicationController
before_action :find_post, only: %i[show edit destroy]

  def new
  	@post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # binding.pry
    if @post.save
    	redirect_to root_path, notice: t(".created")
    else
    	render :new
    end
  end

  def show; end 
  def edit; end

  def destroy
  	@post.delete
  	redirect_to root_path
  end

  def update

  end

  private 
  
  def post_params
  	params.require(:post).permit(:title, :author, :body)
  end

  def find_post
  	@post = Post.find(params[:id])
  end

end
