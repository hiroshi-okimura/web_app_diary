class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_web_app, only: %i[new create edit update]
  before_action :set_review, only: %i[edit update]

  def new
    @review = Review.new
  end

  def create
    @review = @web_app.reviews.build(review_params)
    @review.user_id = current_user.id
    tag_names = params[:review][:tag_names].split(',')
    if @review.save
      @web_app.save_tag(tag_names, current_user)
      flash.now.notice = t('defaults.message.registed', item: Review.model_name.human)
    else
      @tag_list = tag_names.join(',')
      flash.now[:danger] = t('defaults.message.not_registed', item: Review.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @tag_list = @web_app.tags.where(tagmaps: { user_id: current_user.id }).pluck(:name).join(',')
  end

  def update
    tag_names = params[:review][:tag_names].split(',')
    if @review.update(review_params)
      @web_app.save_tag(tag_names, current_user)
      flash.now.notice = t('defaults.message.updated', item: Review.model_name.human)
    else
      @tag_list = tag_names.join(',')
      flash.now[:danger] = t('defaults.message.not_updated', item: Review.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_web_app
    @web_app = WebApp.find(params[:web_app_id])
    @unique_tags = @web_app.tags.distinct
  end

  def set_review
    @review = @web_app.reviews.find_by(user_id: current_user.id)
  end

  def review_params
    params.require(:review).permit(:originality_score, :usability_score, :design_score, :comment)
  end
end
