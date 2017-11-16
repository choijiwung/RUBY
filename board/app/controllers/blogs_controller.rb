class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
  end

  def create
    Blog.create(
      title: params[:title],
      content: params[:content],
      image_url: params[:image_url]
    )
    redirect_to '/'
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
