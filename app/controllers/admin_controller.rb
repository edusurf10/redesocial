class AdminController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    redirect_to new_admin_session_path unless current_admin?
  end

  def current_admin?
    if current_admin.present?
      @admin = current_admin
      true
    elsif
      false
    end
  end

end