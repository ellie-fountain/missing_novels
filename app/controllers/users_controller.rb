class UsersController < ApplicationController
  def index
     #@users = User.find(params[:id])
     #if @user.admin_flg == true
      #@users = User.all
     #else
      #redirect_to root_path
     #end
  end

  def histories
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
  end

  def admin_index
     @users = User.find(params[:id])
     if @users.admin_flg == true
      @users = User.all
     else
      redirect_to root_path
     end
  end

  def show
  	@user = User.find(params[:id])
     #unless @user.id == current_user.id
      #redirect_to user_path(@current_user)
     #end
  end
  def favorites
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
  end

  def edit
  	@user = User.find(params[:id])
    unless current_user.admin_flg == true or @user.id == current_user.id
      redirect_to user_path(@current_user)
    end
  end
  def remove
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  	user = User.find(params[:id])
        user.destroy
        redirect_to root_path
  end
  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :caption)
    end



end
