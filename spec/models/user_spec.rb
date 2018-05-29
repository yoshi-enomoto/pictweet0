# 期待値と実際の値の比較。
# この場合、エラーメッセージの比較。
require "rails_helper"     #共通の設定を有効にさせる
describe User do           #Userクラスのcreateメソッドをテストするまとまりの意味
  describe "#create" do    #メソッド名を書く時は『#』をつける。

    #名前のバリデート確認
    it "is invalid without a nickname" do
        #実フロー（レコード保存）を記述。
        # ・テストしたいプロパティを持ったuserクラスのインスタンスを新規作成する。
        # ・作成したインスタンスがバリデートによって保存出来ない状態かをチェックする。
        # ・チェックした結果、インスタンスが持つエラー文が期待したものであるか確かめる。
        # →元々Railsのgemで用意されているエラーメッセージが表示される。
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    #メールアドレスのバリデート確認
    it "is invalid without a email" do
      user = User.new(nickname: "aiko", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
