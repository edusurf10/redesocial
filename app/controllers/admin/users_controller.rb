class Admin::UsersController < AdminController
  ################INDEX############################
  def index
    @users = User.order(id: :asc)
  end

end