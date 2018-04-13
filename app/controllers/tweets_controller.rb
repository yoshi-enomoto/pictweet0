class TweetsController < ApplicationController

  def index
    # 下記だけではレコード内の各カラムを表示するという都合の良い取り出しは出来ない為、
    # 更にview側で『.カラム名』とする必要がある。
    @tweet = Tweet.find(1)

    # 同様に下記で取り出すには、view側でeachで回す
    @tweets = Tweet.all

  end

end
