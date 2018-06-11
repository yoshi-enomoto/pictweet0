$(document).on("turbolinks:load", function() {

  function buildHTML(post) {
    var html = `<p>
                  <strong>
                    <a href="/users/${post.user_id}">${post.user_nickname}</a>
                    ：${post.text}
                  </strong>
                </p>`
    return html;
  }

  $("#communication_area").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
    $.ajax({
      type: "post",
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    // 非同期通信成功時
    .done(function(data){
      var html = buildHTML(data);
      $(".comments").append(html);
      $("#communication_area")[0].reset();
    })
    // 非同期通信失敗時
    .fail(function() {
      alert("コミュニケーション書き込み一覧への投稿が失敗しました。");
    })
  });
});
