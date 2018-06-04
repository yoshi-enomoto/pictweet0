$(function() {

  function buildHTML(comment) {
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：${comment.text}
                  </strong>
                </p>`
    return html;
  }

  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    //コメントフォームの情報を取得する為に使用。
    // これを用いることで、『ajax』通信内の『data』にそのまま渡せる。
    var formData = new FormData(this);
    // イベント内の『action』属性の値を取得する。そこが送り先のurlとなる為。
    var url = $(this).attr("action");
    // 下記の記述でフルパス取得
    // var href = window.location.href + '/comments'
    $.ajax({
      type: "post",
      url: url,
      data: formData,
      dataType: "json",
      // 双方共に『false』で上書きを防ぐ。
      //クエリ文字列に変換する役割
      processData: false,
      //データのファイル形式を伝えるヘッダ
      contentType: false
    })
    // 非同期通信成功時
    .done(function(data){
      // ビューにhtmlを差し込む。
      var html = buildHTML(data);
      $(".comments").append(html);
      // 入力フォームに空の値を入れる。
      $(".textbox").val("");
    })
    // 非同期通信失敗時
    .fail(function() {
      // コントローラで保存失敗時を設定していても、こちらの処理が現れる。=場合によってはどちらも現れる。
      alert("コメント投稿に失敗しました。");
    })
  });
});
