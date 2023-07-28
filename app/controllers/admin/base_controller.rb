class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path,
    notice: t('defaults.message.not_authorized') unless current_user.admin?
  end
end