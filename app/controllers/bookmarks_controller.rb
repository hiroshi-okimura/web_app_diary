class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    web_app = WebApp.find(params[:web_app_id])
    current_user.bookmark(web_app)
    redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    web_app = current_user.bookmarks.find(params[:id]).web_app
    current_user.unbookmark(web_app)
    redirect_back fallback_location: root_path, status: :see_other, success: t('.success')
  end
end