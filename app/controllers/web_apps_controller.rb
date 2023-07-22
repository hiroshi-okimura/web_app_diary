class WebAppsController < ApplicationController
  def index
    @web_apps = WebApp.all
  end

  def show
    @web_app = WebApp.find(params[:id])
    if user_signed_in?
      @review = @web_app.reviews.find_by(user_id: current_user.id)
    end
  end

  def todayapp
    @web_app = WebApp.first
    if user_signed_in?
      @review = @web_app.reviews.find_by(user_id: current_user.id)
    end
  end
end
