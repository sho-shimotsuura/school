class UsersController < ApplicationController
  before_action :authenticate_user!
  

  def show
    @user = User.find(params[:id])
    if current_user.role == "executive"
      @schools = current_user.schools
    else  
      @favorite_schools = current_user.favorite_schools
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを編集しました！"
    else
      flash.now[:danger] = "プロフィールを更新できませんでした"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
