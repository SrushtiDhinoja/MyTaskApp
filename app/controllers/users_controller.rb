class UsersController < ApplicationController
  def index
    @users = User.all
      respond_to do |format|
        format.html {render "/users/_index"}
        format.js
      end
    if session[:user_id]
      @user = User.find_by(id:  session[:user_id])
    end
  end
end
