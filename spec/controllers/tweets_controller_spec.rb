require 'rails_helper'

describe TweetsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)  #factory_girlでのダミーインスタンスの保存
      get :edit, id: tweet    #これで、上の行で保存したインスタンスのidがセット出来る。
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :edit template" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(response).to render_template :edit
    end
  end

  describe ' GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      # expect(assigns(:tweets)).to match(:tweets)   # 並び替え記述無し
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at })   # 並び替え記述有り
      # ブロック引数aとbについて、『.created_at』で取り出した値を比較。+,-の符号判定する。
      # 『b <=> a』で降順、その逆で昇順の並び替えとなる。
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe ' GET #show' do
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :show, id: tweet
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :show template" do
      tweet = create(:tweet)
      get :show, id: tweet
      expect(response).to render_template :show
    end
  end

  # describe 'HTTPメソッド名 #アクション名' do
  #   it "インスタンス変数は期待した値になるか？" do
  #   "擬似的にリクエストを行ったことにするコードを書く"
  #     "エクスペクテーションを書く"
  #   end

  #   it "期待するビューに遷移するか？" do
  #     "擬似的にリクエストを行ったことにするコードを書く"
  #     "エクスペクテーションを書く"
  #   end
  # end

end
