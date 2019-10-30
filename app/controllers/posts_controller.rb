class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def search
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save!
      redirect_to posts_url, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿が削除されました"
  end

  def update
    @post.update!(post_params)
    redirect_to posts_url, notice: "投稿が更新されました"
  end

  private
  def post_params
    params.require(:post).permit(:title,
                                  :age,
                                  :height,
                                  :body_shape,
                                  :looks_type,
                                  :nanpa_style,
                                  :prefecture,
                                  :place,
                                  :time,
                                  :weather,
                                  :description
                                )
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

end
