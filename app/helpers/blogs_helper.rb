module BlogsHelper
  # def like_button_tag blog, previous_like
  #   return button_to 'Unlike', blog_like_path(blog,previous_like), method: :delete, remote: true if previous_like
  #   button_to 'Like', blog_likes_path(blog), method: :post, remote: true 
  # end
end

# <% pre_like = blog.likes.find { |like| like.user_id == @current_user.id} %>
#     <% if pre_like %>
#       <%= button_to 'Unlike', blog_like_path(blog,pre_like), method: :delete ,class: "button", remote: true %>
#     <% else %>
#       <%= button_to 'Like', blog_likes_path(blog) ,remote: true %>
#       <!-- <i onclick="myFunction(this)" class="fa fa-thumbs-up"></i> -->
#     <i class="fa fa-heart" style="font-size:24px"></i>

#     <% end %>
#     <br>
#     <div class="users">
#       <span><strong>Likes : </strong><%= pluralize(blog.likes.count, 'like')%>
#           <p>Liked by : </p>
#           <% blog_like_user(blog).each do |user|%>
#             <p><%= user %></p>
#           <% end %>
#       </span>
#     </div><br>