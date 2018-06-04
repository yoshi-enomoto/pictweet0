class CommentsController < ApplicationController

  def create
    #『tweet_id』カラムは、ネストしてurlに『@tweet.id』を記述しているので、
    # params[:tweet_id]とするだけで簡単に取得が可能。

      # ストパラ設定前
      # Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
      # ストパラ設定後・リダイレクト設定前
      # Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)

    # # リダイレクト設定後
    # @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)

    # # コメントと結びつくツイート詳細画面に遷移させる。
    # # そのために、このアクション内で使用した値から、関連物を取り出す。
    # redirect_to "/tweets/#{@comment.tweet.id}"
    # # redirect_to tweet_path()?

    # コメント入力欄に対してのバリデート設定後のアクション、リファクタリング
    @comment = Comment.new(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)

    if @comment.save
      redirect_to "/tweets/#{@comment.tweet.id}"
    else
      render "error"
    end
  end

  private
  def comment_params
    # params（フォーム的なの）で送られてくるもののみ。
    params.permit(:text, :tweet_id)
  end
end
