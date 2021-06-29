module CommentsHelper
  def commenter_name(comment)
    commenter_name = User.find(comment.user_id).name
  end
end
