class UsersController < ApplicationController
  def index

  end

  def show
  	@user = User.find(params[:id])
     #unless @user.id == current_user.id
      #redirect_to user_path(@current_user)
     #end
  end

  def edit
  	@user = User.find(params[:id])
     unless @user.id == current_user.id
      redirect_to user_path(@current_user)
     end
  end
  def remove
  	@user = current_user
  end
  
  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。."
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


end
