class PostsController < ApplicationController

  def create
      # 非同期通信の為に刷新
      # @post = Post.create(text: post_params[:text], detail_id: post_params[:detail_id], user_id: current_user.id)

    @user = User.new(id: user_params[:user_id])

      # # redirect_to "/users/#{@post.user_id}/details/#{@post.detail_id}"
      # # この『.user_id』は『@post』を作成したユーザーのidが取れてしまう為、
      # # 『@user』を作成して、そのidを取得して、URLに渡してやる。
      # redirect_to "/users/#{@user.id}/details/#{@post.detail_id}"

    @post = Post.new(text: post_params[:text], detail_id: post_params[:detail_id], user_id: current_user.id)

    if @post.save
      respond_to do |format|
        format.html { redirect_to "/users/#{@user.id}/details/#{@post.detail_id}" }
        format.json
      end
    # else
    #   render "error"
    end
  end

  private
  def post_params
    params.permit(:text, :detail_id)
  end

  def user_params
    params.permit(:user_id)
  end
end
