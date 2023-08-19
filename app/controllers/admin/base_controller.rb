class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, danger: t('defaults.message.not_authorized')
    end
  end
end
