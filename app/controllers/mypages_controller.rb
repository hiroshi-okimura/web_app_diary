class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    start_date = params.fetch(:start_date, Date.today).to_date
    @reviews = Review.includes(:web_app)
                     .where(user_id: current_user.id)
                     .where(webapp_offer_date: start_date.beginning_of_month..start_date.end_of_month)
    @my_tags = current_user.tags.distinct
  end

  def bookmark
    @bookmark_web_apps = current_user.bookmark_web_apps.order(created_at: :desc).page(params[:page])
    if user_signed_in?
      @user_tags = current_user.tagmaps.includes(:tag).group_by(&:web_app_id).transform_values { |v| v.map(&:tag) }
      reviewed_web_app_ids = current_user.reviews.pluck(:web_app_id)
      @reviewed_web_app_ids = reviewed_web_app_ids.to_set
    end
  end

  def notification
    @user = current_user
  end

  def setting_notify
    @user = current_user
    time_params = notify_time_params
    time_params["notify_time(5i)"] = "00"

    if @user.update(time_params)
      redirect_to mypage_path, success: t('defaults.message.notify_registed')
    else
      flash.now[:danger] = t('defaults.message.notify_not_registed')
      render :notification, status: :unprocessable_entity
    end
  end

  def remove_notify
    @user = current_user
    @user.update(notify_time: nil)
    redirect_to mypage_path, success: t('defaults.message.notify_removed')
  end

  private

  def notify_time_params
    params.require(:user).permit(:notify_time)
  end
end
