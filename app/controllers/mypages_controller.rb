class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookmark_web_apps = current_user.bookmark_web_apps.order(created_at: :desc)
  end
end
