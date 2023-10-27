class WebAppsController < ApplicationController
  before_action :set_web_app, only: %i[show todayapp]
  before_action :set_review, only: %i[show todayapp], if: :user_signed_in?

  def index
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @web_apps = @tag.web_apps.includes(:tags).order(offer_date: :desc).page(params[:page])
      if user_signed_in?
        @user_tags = current_user.tagmaps.includes(:tag).group_by(&:web_app_id).transform_values { |v| v.map(&:tag) }
        reviewed_web_app_ids = current_user.reviews.pluck(:web_app_id)
        @reviewed_web_app_ids = reviewed_web_app_ids.to_set
      end
    else
      @web_apps = WebApp.where('offer_date <= ?', Date.today).includes(:tags).order(offer_date: :desc).page(params[:page])
      if user_signed_in?
        @user_tags = current_user.tagmaps.includes(:tag).group_by(&:web_app_id).transform_values { |v| v.map(&:tag) }
        reviewed_web_app_ids = current_user.reviews.pluck(:web_app_id)
        @reviewed_web_app_ids = reviewed_web_app_ids.to_set
      end
    end
  end

  def show; end

  def todayapp; end

  private

  def set_web_app
    @web_app = action_name == 'todayapp' ? WebApp.includes(:reviews).find_by(offer_date: Date.today) : WebApp.includes(:reviews).find(params[:id])
    @unique_tags = @web_app.tags.distinct
  end

  def set_review
    @review = @web_app.reviews.find_by(user_id: current_user.id, webapp_offer_date: @web_app.offer_date)
  end
end
