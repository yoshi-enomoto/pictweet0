class DetailsController < ApplicationController

  def new
    # アクション->ビューのフローなので、ここで『@detail』を定義しないと、
    # ビュー側で箱とし使えず、同時に次の『create』アクションへ情報を送れない。
    @detail = Detail.new
  end

  def create
    # 『ビューnew』からsubmitされるものは、form_forの仕様でここに流れてくる。
    @detail = Detail.new(detail_params)
    @detail.save
    redirect_to @detail
    # 引数である@detailに格納された情報を参照するページを描画する処理。
    # ->内部的には、showアクションを実行して、『show.html.haml』を表示する。
  end

  def show
    @details = Detail.all
  end

  private
  def detail_params
    # params（フォーム的なの）で送られてくるもののみ。
    params.require(:detail).permit(:body, :gender, :birthday, :hometown)
    # 後々に、『user_id』もcurrent_userを登録させる？
  end

end
