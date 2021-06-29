class CommentsController < ApplicationController
  include LikesHelper

  before_action :find_blog
  def index
    @comments = @blog.comments
  end
  def new
    @comment = @blog.comments.new
  end
  def create
    @comment = @blog.comments.create(comment_params)
    # puts "=================#{commenter_name(@comment)}"
    if @comment.save
      redirect_to blog_comments_path
    else
      render :new
    end
  end 
  private
  def comment_params
    params[:comment][:user_id] = @current_user.id
    params.require(:comment).permit(:body,:user_id)
  end

  def find_blog
    @blog = Blog.find_by(id: params[:blog_id])
  end
end
