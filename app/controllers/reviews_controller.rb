class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @web_app = WebApp.find(params[:web_app_id])
    @review = @web_app.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to web_app_path(@web_app)
    else
      redirect_to web_app_path(@web_app)
    end
  end

  private

  def review_params
    params.require(:review).permit(:originality_score, :usability_score, :design_score, :comment)
  end
end
