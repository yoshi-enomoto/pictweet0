$(document).on("turbolinks:load", function() {

  $("#communication_area").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
  });
});
