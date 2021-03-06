class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && (@user.password == params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Login Successfully!!!"
    else
      flash[:alert] = "Invalid Email or password!!!!!!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout Successfully!!!"
  end
end
