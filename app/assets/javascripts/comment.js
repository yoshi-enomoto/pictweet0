$(function() {
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    //コメントフォームの情報を取得する為に使用。
    // これを用いることで、『ajax』通信内の『data』にそのまま渡せる。
    var formData = new FormData(this);
    // イベント内の『action』属性の値を取得する。そこが送り先のurlとなる為。
    var url = $(this).attr("action");
    $.ajax({
      type: "post",
      url : url,
      data: formData,
      dataType: "json"
      // 双方共に『false』で上書きを防ぐ。
      //クエリ文字列に変換する役割
      processData: false,
      //データのファイル形式を伝えるヘッダ
      contentType: false
    })
  });
});
