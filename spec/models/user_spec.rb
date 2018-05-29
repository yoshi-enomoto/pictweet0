# 期待値と実際の値の比較。
# この場合、エラーメッセージの比較。
require "rails_helper"     #共通の設定を有効にさせる
describe User do           #Userクラスのcreateメソッドをテストするまとまりの意味
  describe "#create" do    #メソッド名を書く時は『#』をつける。

    # #名前のバリデート確認
    # it "is invalid without a nickname" do
    #     #実フロー（レコード保存）を記述。
    #     # ・テストしたいプロパティを持ったuserクラスのインスタンスを新規作成する。
    #     # ・作成したインスタンスがバリデートによって保存出来ない状態かをチェックする。
    #     # ・チェックした結果、インスタンスが持つエラー文が期待したものであるか確かめる。
    #     # →元々Railsのgemで用意されているエラーメッセージが表示される。
    #   user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
    #   user.valid?   #この1文が無いと、エラーメッセージが格納されない様子。
    #   expect(user.errors[:nickname]).to include("can't be blank")
    # end

    # #メールアドレスのバリデート確認
    # it "is invalid without a email" do
    #   user = User.new(nickname: "aiko", email: "", password: "00000000", password_confirmation: "00000000")
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # 『Girl_Factory_rails』導入後の書き方
    # 正常保存
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 各カラムが空の場合
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)    #『nil』と『""』は同じ表現で使用可能。
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 『include』は完全一致が条件（大文字、小文字を区別する）
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # 独自
    it "is invalid password and password_confirmation that it doesn't match" do
      user = build(:user, password: "123456789", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 境界値の確認
    # ネーム
    it "is valid with a nickname (6 characters) " do
      user = build(:user, nickname: "123456")
      expect(user).to be_valid
    end

    it "is invalid with a nickname (over 6 characters)" do
      user = build(:user, nickname: "1234567")
      user.valid?
      # expect(user.errors[:nickname]).to include("is too long")
      # エラー文が複数含まれる場合があり、その場合に配列内の順番数を指定しないといけない為。
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    # パスワード
    it "is valid with a password (6 characters) " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "is invalid with a password (less than 6 characters)" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      # expect(user).to include("is too short")
      # エラー文が複数含まれる場合があり、その場合に配列内の順番数を指定しないといけない為。
      expect(user.errors[:password][0]).to include("is too short")
    end

    # 重複したemailアドレスについて
    it "is invalid with a duplicate email address" do
      user = create(:user)       #他とは異なり、『build』ではなく『create』DBへ保存させる。
      another_user = build(:user)
      # another_user = build(:user, email: user.email)  ：模範解答その２
      another_user.valid?   # 後から保存するものに対して『.valid?』を使う。
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end
end
