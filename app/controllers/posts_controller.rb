class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to posts_url, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "投稿が削除されました"
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
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


end
