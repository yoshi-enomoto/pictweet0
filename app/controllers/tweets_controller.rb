class TweetsController < ApplicationController

  # 記述の際、except,onlyをつけるには『,』が必要
  before_action :move_to_index, except: :index

  def index
    # 下記だけではレコード内の各カラムを表示するという都合の良い取り出しは出来ない為、
    # 更にview側で『.カラム名』とする必要がある。
      # @tweet = Tweet.find(1)

    # 同様に下記で取り出すには、view側でeachで回す
    # @tweets = Tweet.all
    # @tweets = Tweet.order("created_at DESC")   #『order』メソッドは『all』を省略可能
    # @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
    # 『n+1』問題の対処
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    # web上からこのアクションが発火されれば、下記実行（＝入力問わず、下記のみがDBへ保存される）
    # Tweet.create(name: "aiko", image: "http://s3.aiko.s3.amazonaws.com/wordpress/wp-content/uploads/2018/04/tsujo_s.jpeg", text: "お前の送信ボタンは効力を効かない！")

    # 下記、ストパラ設定前の保存方法
      # Tweet.create(name: params[:name], image: params[:image], text: params[:text])
    # 下記、ストパラ設定後の保存方法
      # Tweet.create(tweet_params)
    # 下記、ツイート時にcurrent_userの名前を付加保存する
    # （ストパラ以外の項目を保存する必要がある為、書き換える）
    # 引数の形は『(カラム名: 保存する値, カラム名: 保存する値, …)』
      # Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    # 下記、不要カラム削除後の保存
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    # 『params[:id]』で選択したtweetのidを取得出来る。（選択送信時のリクエストに値が入る）
    tweet = Tweet.find(params[:id])
    # ログインユーザーと取得したツイートのユーザーの一致確認
    tweet.destroy if tweet.user.id == current_user.id
  end

  def edit
    # 『params[:id]』で選択したtweetのidを取得出来る。
    @tweet = Tweet.find(params[:id])
  end

  def update
    # 『params[:id]』で選択したtweetのidを取得、
    tweet = Tweet.find(params[:id])
    # その後、フォームから入力された値を更新する
    # ログインユーザーと取得したツイートのユーザーの一致確認
    tweet.update(tweet_params) if tweet.user.id == current_user.id
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    # 不要カラム削除前のストパラ
      # params.permit(:name, :image, :text)
    # 不要カラム削除後のストパラ
    params.permit(:image, :text)
  end

  # 記述の際、unlessをつけるには『,』が不要
  def move_to_index
    redirect_to action: :inex unless user_signed_in?
  end
end
