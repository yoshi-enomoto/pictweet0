class UsersController < ApplicationController

  def show
    #『current_user』には、ユーザーのレコードのインスタンスが代入されている為、
    #『.カラム名』でカラムの値が取得可能
    @nickname = current_user.nickname
    # 『nickname』の取得なら、下記の記述でも可能
    # @nickname = User.find(current_user.id).nickname

    # アソシエーション前の取得方法
    @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    # アソシエーション後の取得方法
    @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
    # 下記の記述でも可能
    # @nickname = User.find(current_user.id).tweets.page(params[:page]).per(5).order("created_at DESC")
  end
end
