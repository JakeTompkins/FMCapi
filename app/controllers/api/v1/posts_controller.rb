class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { message: "post created" }, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(
    params[:id]
    )
  end

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
