$(function() {
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    //コメントフォームの情報を取得する為に使用。
    var formData = new FormData(this);
  });
});
