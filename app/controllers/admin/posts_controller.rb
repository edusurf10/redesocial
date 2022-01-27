class Admin::PostsController < AdminController
  ################INDEX############################
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

end