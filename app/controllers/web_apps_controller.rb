class WebAppsController < ApplicationController
  def index
    @web_apps = WebApp.all
  end

  def show
    @web_app = WebApp.find(params[:id])
  end

  def todayapp
    @web_app = WebApp.first
  end
end
