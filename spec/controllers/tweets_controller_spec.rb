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
