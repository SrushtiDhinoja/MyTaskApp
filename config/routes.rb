Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"  
  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"

  get "/sign_in", to: "logins#new"
  post "/sign_in", to: "logins#create"

  delete "/logout", to: "logins#destroy"

  resources :users , only: [:index] do
    resources :blogs , only: [:new,:create] do
      collection do
        get 'my_blogs'
        post 'my_blogs'
      end
    end
  end

  scope '/other_blogs' do
    resources :blogs do
      resources :likes
      resources :comments do
        resources :likes
      end
    end
  end

  # get "/users/my_blogs", to: "blogs#my_blog"
  # get "/others_blogs", to: "blogs#others_blog"

  # get "/users/:user_id/blogs/new", to: "blogs#new" , as: :new_user_blog
  # post "/users/my_blogs", to: "blogs#create"

  # get "/others_blogs/:blog_id/comments", to:"comments#index", as: :blog_comments

  # get "/others_blogs/:blog_id/comments/new", to: "comments#new", as: :new_blog_comment
  # post "/others_blogs/:blog_id/comments", to: "comments#create", as: :blog_comment

  # post "/others_blogs/:blog_id/likes", to: "likes#create", as: :blog_like
  # delete "/others_blogs/:blog_id/likes/:id", to: "likes#destroy", as: :destroy_blog_like

  # post "/others_blogs/:blog_id/comments/:comment_id/likes", to: "comments_likes#create", as: :blog_comment_like
  # delete "/others_blogs/:blog_id/comments/:comment_id/likes/:id", to: "comments_likes#destroy", as: :destroy_blog_comment_like

end
