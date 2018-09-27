class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    # before_action
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Post criado com sucesso"
    else
      render :new
    end
    redirect_to root_path
  end

  def update
    # before_action
    @blog.update(blog_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @blog.destroy
    redirect_to root_path
  end


  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :photo, :photo_cache)
  end
end
