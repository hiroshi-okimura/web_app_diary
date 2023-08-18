class Admin::WebAppsController < Admin::BaseController
  before_action :set_web_app, only: %i[show edit update destroy]

  def index
    @web_apps = WebApp.order(offer_date: :desc)
  end

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
      redirect_to admin_web_apps_path, success: t('defaults.message.registed', item: WebApp.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_registed', item: WebApp.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @web_app.update(web_app_params)
      redirect_to admin_web_app_path(@web_app), success: t('defaults.message.updated', item: WebApp.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: WebApp.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @web_app.destroy
    redirect_to admin_web_apps_path, status: :see_other, success: t('defaults.message.deleted', item: WebApp.model_name.human)
  end

  private

  def set_web_app
    @web_app = WebApp.find(params[:id])
  end

  def web_app_params
    params.require(:web_app).permit(:site_name, :url, :ogp_title, :ogp_description, :ogp_image, :offer_date)
  end
end
