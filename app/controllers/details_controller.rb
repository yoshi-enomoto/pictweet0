class DetailsController < ApplicationController

  def new
    # アクション->ビューのフローなので、ここで『@detail』を定義しないと、
    # ビュー側で箱とし使えず、同時に次の『create』アクションへ情報を送れない。
    @detail = Detail.new
    @user = User.find(params[:user_id])
  end

  def create
    # 『ビューnew』からsubmitされるものは、form_forの仕様でここに流れてくる。
    @detail = Detail.new(detail_params)
    @detail.save

    # redirect_to @detail ：ネスト前のリダイレクト方法
    # 引数である@detailに格納された情報を参照するページを描画する処理。
    # ->内部的には、showアクションを実行して、『show.html.haml』を表示する。
  end

  def show
    @detail = Detail.find(params[:id])
    # ビュー側で『each』を使用するのは、複数のレコードが入った場合。
    # １レコードのみなら、.カラム名で取り出せる。

    # コミュニケーション欄の表示（最新順）
    @posts = @detail.posts.includes(:user).order("created_at DESC")
  end

  def edit
    # 『params[:id]』で選択したdetailのidを取得出来る。
    @detail = Detail.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    # ビューから受け取ったパラメータからidを元に、レコードを取得する。
    @detail = Detail.find(params[:id])
    # 『update』メソッドを利用してレコードの値を更新。
    @detail.update(detail_params)
  end

  def profile
    @user =User.find(params[:user_id])
  end

  private
  def detail_params
    # params（フォーム的なの）で送られてくるもののみ。
    # ネスト後、『merge』メソッドで『user_id』を追加保存
    params.require(:detail).permit(:body, :gender, :birthday, :hometown).merge(user_id: params[:user_id])
  end
end
