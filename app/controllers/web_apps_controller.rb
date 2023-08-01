class WebAppsController < ApplicationController
  before_action :set_web_app, only: %i[show todayapp]
  before_action :set_review, only: %i[show todayapp], if: :user_signed_in?

  def index
    @web_apps = WebApp.all
  end

  def show; end

  def todayapp; end

  private

  def set_web_app
    @web_app = action_name == 'todayapp' ? WebApp.find_by(offer_date: Date.today) : WebApp.find(params[:id])
  end

  def set_review
    @review = @web_app.reviews.find_by(user_id: current_user.id)
  end
end
