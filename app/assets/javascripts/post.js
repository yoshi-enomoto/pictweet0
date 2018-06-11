$(document).on("turbolinks:load", function() {

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
