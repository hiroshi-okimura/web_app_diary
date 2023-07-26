class WebAppsController < ApplicationController
  before_action :set_web_app, only: %i[show todayapp]
  before_action :set_review, only: %i[show todayapp], if: :user_signed_in?

  def new
    @web_app = WebApp.new
  end

  def create
    @web_app = WebApp.new(web_app_params)

    options = {
      fullpage: 1, 
      width: "", 
      viewport: "", 
      format: "", 
      css_url: "", 
      delay: 3, 
      ttl: "", 
      force: "", 
      placeholder: "", 
      user_agent: "", 
      accept_lang: "", 
      export: "" 
    }

    screenshot_url = ScreenshotService.screenshotlayer(@web_app.url, options)
    @web_app.remote_screenshot_url = screenshot_url
  
    if @web_app.save
      redirect_to web_app_path(@web_app), notice: "Webアプリを登録しました"
    else
      flash.now[:danger] = "Webアプリの登録に失敗しました"
      render :new
    end
  end

  def index
    @web_apps = WebApp.all
  end

  def show; end

  def todayapp; end

  private

  def set_web_app
    @web_app = action_name == 'todayapp' ? WebApp.first : WebApp.find(params[:id])
  end

  def set_review
    @review = @web_app.reviews.find_by(user_id: current_user.id)
  end

  def web_app_params
    params.require(:web_app).permit(:site_name, :url, :ogp_title, :ogp_description, :ogp_image, :screenshot, :offer_date)
  end
end
