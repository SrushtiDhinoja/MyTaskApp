module LikesHelper
  def blog_already_liked?
    Like.where(user_id: @current_user.id, likeable_id: params[:blog_id] ,likeable_type: "Blog").exists?
  end
  def comment_already_liked?
    Like.where(user_id: @current_user.id, likeable_id: params[:comment_id] ,likeable_type: "Comment").exists?
  end
  def blog_like_user(blog)
    blog.likes.map {|i| i.user.name}
  end
  def comment_like_user(comment)
    comment.likes.map {|i| i.user.name}
  end
  def like_button_tag blog, previous_like
    # previous_like = @blog.likes.find { |like| like.user_id == @current_user.id}
    return link_to 'Unlike', blog_like_path(blog,previous_like), class: "btn btn-secondary", method: :delete, remote: true if previous_like
    link_to 'Like', blog_likes_path(blog),class: "btn btn-secondary",method: :post, remote: true 
  end
end
