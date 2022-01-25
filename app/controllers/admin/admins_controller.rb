class Admin::AdminsController < AdminController
  before_action :set_admin, only: [:edit, :update, :destroy]
  ################INDEX############################
  def index
    @admins = Admin.order(id: :asc)
  end
  ################NEW##############################
  def new
    @admin = Admin.new
  end
  ################CREATE###########################
  def create
    @admin = Admin.new(form_params)
    if @admin.save
      redirect_to admin_admins_path
    else
      render :new
    end
  end
  ##################EDIT##############################
  def edit
  end
  ##################UPDATE###########################
  def update
    params = form_params[:password].blank? && form_params[:password_confirmation].blank? ? form_params.except(:password, :password_confirmation) : form_params
    if @admin.update(params)
      redirect_to admin_admins_path
    else
      render :edit
    end
  end
  ##################DESTROY#########################
  def destroy
    @admin.destroy
    redirect_to admin_admins_path
  end
  ##############PRIVATE##############################
  private

  def form_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end