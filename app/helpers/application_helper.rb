module ApplicationHelper

  def calculate_age(var)
    date_format = "%Y%m%d"
    birthday = var.to_date
    age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000

      # 上記解説
        # ・文字列を代入。
        # @birthday = "1987/6/10"

        # ・日付のフォーマットの指定
        # date_format = "%Y%m%d"
        # →『19870610』のフォーマットになる

        # ・文字列をDate型へ変換
        # birthday = @birthday.to_date

        # ・本日の日付から誕生日を引き算し、1万で割った商の小数点で切り捨てて、年齢を算出。
        # @age = (Date.today.strftime(date_format).to_i -birthday.strftime(date_format).to_i) / 10000
        #   １：Dateクラス の todayメソッド で本日の日付を取得
        #   ２：strftimeメソッドで指定したフォーマットに変換（引数）
        #   ３：to_i メソッドで数値に変換

        # ※その他のフォーマットの指定方法
        # %Y年%m月%d日：1987年6月10日
        # %Y年%m月：1987年1月
        # %Y年：1987年
  end
end
