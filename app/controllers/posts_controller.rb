class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save

      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def type1_new
    @post = Post.new(type: 'Type1')
  end

  def type1_create
    @post = Post.new(post_params.merge(type: 'Type1'))
    if @post.save
      redirect_to posts_path
    else
      render :type1_new
    end
  end

  def type1_edit
    # Type 1 投稿編集フォーム
  end

  def type1_update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :type1_edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
