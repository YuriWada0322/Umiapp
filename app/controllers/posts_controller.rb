class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all.page(params[:page]).per(6)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @post.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @post.save
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = current_user.comments.build
    @comments = @post.comments
  end

  private
    def post_params
      params.require(:post).permit(:body, :location, :address)
    end
end
