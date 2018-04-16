class TweetsController < ApplicationController

  # 記述の際、except,onlyをつけるには『,』が必要
  before_action :move_to_index, except: :index

  def index
    # 下記だけではレコード内の各カラムを表示するという都合の良い取り出しは出来ない為、
    # 更にview側で『.カラム名』とする必要がある。
    @tweet = Tweet.find(1)

    # 同様に下記で取り出すには、view側でeachで回す
    # @tweets = Tweet.all
    # @tweets = Tweet.order("created_at DESC")   #『order』メソッドは『all』を省略可能
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    # web上からこのアクションが発火されれば、下記実行（＝入力問わず、下記のみがDBへ保存される）
    # Tweet.create(name: "aiko", image: "http://s3.aiko.s3.amazonaws.com/wordpress/wp-content/uploads/2018/04/tsujo_s.jpeg", text: "お前の送信ボタンは効力を効かない！")

    # 下記、ストパラ設定前の保存方法
    # Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    # 下記、ストパラ設定後の保存方法
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.permit(:name, :image, :text)
  end

  # 記述の際、unlessをつけるには『,』が不要
  def move_to_index
    redirect_to action: :inex unless user_signed_in?
  end
end
