class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    start_date = params.fetch(:start_date, Date.today).to_date
    @web_apps_with_reviews = WebApp.joins(:reviews).where(reviews: { user_id: current_user.id }).where(offer_date: start_date.beginning_of_month..start_date.end_of_month)
  end

  def bookmark
    @bookmark_web_apps = current_user.bookmark_web_apps.order(created_at: :desc)
  end

  def notification
    @user = current_user
  end
end
