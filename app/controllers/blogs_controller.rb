class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :edit, :destroy]
  skip_before_action :authenticate_user!

  def index
    @blogs = policy_scope(Blog).order(created_at: :asc)
    authorize Blog
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def show
    # before_action
    authorize @blog
  end

  def edit
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params)
    authorize @blog
    if @blog.save
      flash[:notice] = "Post criado com sucesso"
    else
      render :new
    end
    redirect_to blog_path(@blog)
  end

  def update
    # before_action
    @blog.update(blog_params)
    authorize @blog
    redirect_to blog_path(@blog)
  end

  def destroy
    # before_action
    @blog.destroy
    authorize @blog
    redirect_to root_path
  end


  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :photo, :photo_cache)
  end
end
