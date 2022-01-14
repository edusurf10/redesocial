class Admin::AdminsController < AdminController
  def index
    @admins = Admin.order(id: :desc)
  end

  def def new
    @admin = Admin.new
  end
  
end