class Admin::AdminsController < AdminController

  def index
    @admins = Admin.order(id: :asc)
  end
#############################################
  def new
    @admin = Admin.new
  end
#############################################
  def create
    @admin = Admin.new(form_params)
    if @admin.save
      redirect_to admin_admins_path
    else
      render :new
    end
  end
#############################################
  def edit
    @admin = Admin.find(params[:id])
  end
#############################################
  def update
    @admin = Admin.find(params[:id])
    params = form_params
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except(:password, :password_confirmation)
    end
    # logger.debug "Params para update: #{params.inspect}"
    if @admin.update(params)
      logger.debug "Update feito com sucesso, redirecionando"
      redirect_to admin_admins_path
    else
      logger.debug "Update falhou com os parametros: #{params.inspect}"
      render :edit
    end
  end
#############################################
  private

  def form_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end