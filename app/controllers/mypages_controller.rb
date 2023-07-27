class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_user = User.find_by(id: current_user.id)
  end
end
