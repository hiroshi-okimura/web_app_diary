class WebAppsController < ApplicationController
  def index
    @web_apps = WebApp.all
  end

  def show; end

  def todayapp
    @web_app = WebApp.first
  end
end
