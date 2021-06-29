class LikesController < ApplicationController
  def create
    if blog_already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @blog = Blog.find(params[:blog_id])
      @like = @blog.likes.create(user_id: @current_user.id)
      # method = method: :delete
      # url = blog_like_path(@blog,@like)
      # like = Like
    end

    # if comment_already_liked?
    #   flash[:notice] = "You can't like more than once"
    # else
    #   @comment = Comment.find_by(id: params[:comment_id])
    #   @comment.likes.create(user_id: @current_user.id)
    #   redirect_to blog_comments_path and return
    # end
    
  end
  def destroy
    # unless comment_already_liked?
    #   flash[:notice] = "Cannot unlike"
    # else
    #   @comment = Comment.find(params[:comment_id])
    #   @comment_like = @comment.likes.find(params[:id])
    #   @comment_like.destroy
    # redirect_to blog_comments_path and return
    # end
  # elsif(Like.where(:likeable_type == "Comment")).exists?
    unless blog_already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @blog = Blog.find(params[:blog_id])
      @like = @blog.likes.find(params[:id])
      @like.destroy
    # redirect_to blogs_path and return
    end
    # end
  end

  private

  def blog_already_liked?
    Like.where(user_id: @current_user.id, likeable_id: params[:blog_id] ,likeable_type: "Blog").exists?
  end
  def comment_already_liked?
    Like.where(user_id: @current_user.id, likeable_id: params[:comment_id] ,likeable_type: "Comment").exists?
  end
end
