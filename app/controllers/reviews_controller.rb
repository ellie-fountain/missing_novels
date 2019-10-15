class ReviewsController < ApplicationController

  PER = 20

  def index
    # @reviews = Review.page(params[:page]).per(PER)
  	#@reviews = Review.all
    #@user = User.find(@review.user_id)
    @all_ranks = Review.find(Favorite.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
    @q = Review.page(params[:page]).per(PER).ransack(params[:q])
    @reviews = @q.result(distinct: true)
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
    @favorite = Favorite.new
    @q = Review.ransack(params[:q])
  end

  def new
    @review = Review.new
    @q = Review.ransack(params[:q])
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user_id == current_user.id
      redirect_to reviews_path
    end
    @q = Review.ransack(params[:q])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "レビューが無事投稿されました！"
      redirect_to review_path(@review)
    else
      @reviews = Review.all
      @user = current_user
      render :index
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    if @review.update(review_params)
      flash[:notice] = "レビューの情報を更新しました！"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
  def tag_searched
    @reviews = Review.tagged_with("#{params[:tag_name]}")
  end

  private
    def review_params
      params.require(:review).permit(:review_title, :novel_name, :review_text, :tag_list)
    end

end