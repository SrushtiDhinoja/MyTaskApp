class CommentsLikesController < ApplicationController
  before_action :find_comment
  before_action :find_like, only: [:destroy]

  # def create
  #   @comment.comments_likes.create(user_id: current_user.id,blog_id: params[:blog_id])
  #   redirect_to blog_comments_path
  # end
  def already_liked?
    CommentsLike.where(user_id: @current_user.id, blog_id:
    params[:blog_id], comment_id: params[:comment_id]).exists?
  end
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @comment.likes.create(user_id: @current_user.id, blog_id: params[:blog_id])
    end
    redirect_to blog_comments_path
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to blog_comments_path
  end
  private
  def find_comment
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find_by(id: params[:comment_id])
  end
  def find_like
   @like = @comment.likes.find(params[:id])
  end

end
