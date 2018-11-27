class HomeController < ApplicationController
  def index
  	@post = Post.all.orser('created_at DESC')
  end
end
