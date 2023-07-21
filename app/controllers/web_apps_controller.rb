class WebAppsController < ApplicationController
  def index; end

  def show; end

  def todayapp
    @web_app = WebApp.first
  end
end
