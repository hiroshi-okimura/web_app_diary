class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

  def new
    @web_app = WebApp.find(params[:web_app_id])
    @review = Review.new
  end

  def create
    @web_app = WebApp.find(params[:web_app_id])
    @review = @web_app.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to web_app_path(@web_app), success: "レビューを記録しました"
    else
      redirect_to web_app_path(@web_app), danger: "レビューの記録に失敗しました"
    end
  end

  def edit
    @web_app = WebApp.find(params[:web_app_id])
    if user_signed_in?
      @review = @web_app.reviews.find_by(user_id: current_user.id)
    end
  end

  def update
    @web_app = WebApp.find(params[:web_app_id])
    if user_signed_in?
      @review = @web_app.reviews.find_by(user_id: current_user.id)
    end
    if @review.update(review_params)
      redirect_to web_app_path(@web_app), success: "レビューを更新しました"
    else
      redirect_to web_app_path(@web_app), danger: "レビューの更新に失敗しました"
    end
  end

  private

  def review_params
    params.require(:review).permit(:originality_score, :usability_score, :design_score, :comment)
  end
end
