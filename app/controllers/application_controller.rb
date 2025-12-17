class ApplicationController < ActionController::Base
  before_action :set_dummy_user

  private

  def set_dummy_user
    @current_user = User.first || User.create!(
      email: "demo@voice.app"
    )
  end

  def current_user
    @current_user
  end
  helper_method :current_user
end
