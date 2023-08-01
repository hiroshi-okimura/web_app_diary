class Admin::WebAppsController < Admin::BaseController
  def index
    @web_apps = WebApp.all
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
      redirect_to admin_web_apps_path, notice: "Webアプリを登録しました"
    else
      flash.now[:danger] = "Webアプリの登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @web_app = WebApp.find(params[:id])
  end

  def edit
    @web_app = WebApp.find(params[:id])
  end

  def update
    @web_app = WebApp.find(params[:id])
    if @web_app.update(web_app_params)
      redirect_to admin_web_app_path(@web_app), notice: "Webアプリを更新しました"
    else
      flash.now[:danger] = "Webアプリの更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @web_app = WebApp.find(params[:id])
    @web_app.destroy
    redirect_to admin_web_apps_path, status: :see_other, notice: "Webアプリを削除しました"
  end

  private

  def web_app_params
    params.require(:web_app).permit(:site_name, :url, :ogp_title, :ogp_description, :ogp_image, :offer_date)
  end
end
