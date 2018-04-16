class UsersController < ApplicationController

  def show
    #『current_user』には、ユーザーのレコードのインスタンスが代入されている為、
    #『.カラム名』でカラムの値が取得可能
    @nickname = current_user.nickname
    # 『nickname』の取得なら、下記の記述でも可能
    # @nickname = User.find(current_user.id).nickname
    @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    binding.pry
  end
end
