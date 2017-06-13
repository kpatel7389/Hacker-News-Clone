$(document).ready(function() {
  $("nav").on("click", ".register-link", function(event) {
    event.preventDefault();
    console.log("working");

    var link = $(this).attr("href");
    console.log(link);
    var request = $.ajax({
      url: link,
      method: "GET"
    })
    request.done(function(response) {
      $('.register').hide();
      $('.register-link').after(response);
    })
  })
});
