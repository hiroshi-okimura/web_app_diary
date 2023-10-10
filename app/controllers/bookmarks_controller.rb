class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @web_app = WebApp.find(params[:web_app_id])
    current_user.bookmark(@web_app)
  end

  def destroy
    @web_app = current_user.bookmarks.find(params[:id]).web_app
    current_user.unbookmark(@web_app)
  end
end
