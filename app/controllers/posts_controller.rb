class PostsController < ApplicationController

  def create
    @post = Post.create(text: post_params[:text], detail_id: post_params[:detail_id], user_id: current_user.id)

    # redirect_to "/users/#{@post.user_id}/details/#{@post.detail_id}"
    redirect_to controller: 'details', action: 'show', id: 8

    # redirect_to "/users/:user_id/details/#{@post.detail_id}"
    # binding.pry
    # どっちが取得、この『.user_id』だと？
    # →『@post』を作成したユーザーのid。
  end

  private
  def post_params
    params.permit(:text, :detail_id)
  end
end
