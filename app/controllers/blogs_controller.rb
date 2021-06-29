class BlogsController < ApplicationController
  include LikesHelper
  before_action :require_login
  def my_blogs
    respond_to do |format|
      format.html {render "/blogs/_my_blogs" }
      format.js
    end
  end
  def index
    @other_blogs = Blog.where("user_id != ?", @current_user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = @current_user.blogs.create(blog_params)
    if @blog.save
      redirect_to my_blogs_user_blogs_path
    else
      render :new
    end
  end
  private
  def blog_params
    params.require(:blog).permit(:blog_title, :description)
  end
end
