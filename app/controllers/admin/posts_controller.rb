class Admin::PostsController < AdminController
  ################INDEX############################
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  rescue
    redirect_to admin_posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

end