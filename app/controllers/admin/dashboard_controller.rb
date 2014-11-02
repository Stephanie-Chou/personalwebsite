class Admin::DashboardController < ApplicationController
  #Get form for new user
  def new
    @user = User.new
  end

	def logout
		session.clear
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render admin_path
    end
  end

  def login
  	@user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      p session[:user_id]
			redirect_to root_path
    else
      redirect_to admin_path
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
