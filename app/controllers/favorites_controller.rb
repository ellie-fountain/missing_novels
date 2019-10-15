class FavoritesController < ApplicationController
  def index
  	@favorite = Favorite.find_by(user_id: user.id)
  end
  def create
    @favorite = current_user.favorites.create(review_id: params[:review_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(review_id: params[:review_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
