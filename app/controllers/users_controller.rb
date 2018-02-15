class UsersController < ApplicationController
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #redirect_to user_path(@user.id)
      flash[:notice] = 'アカウントを作成しました。再ログインしてください。'
      redirect_to new_session_path
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @favorite_pictures = @user.favorite_pictures
  end
  
  def list
    @user = current_user
    @favorite_pictures = @user.favorite_pictures
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
