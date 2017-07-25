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
      $('.register').remove();
      $('.register-link').after(response);
    })
  })
  $("nav").on("click", ".login-link", function(event) {
    event.preventDefault();

    var link = $(this).attr("href");
    var request = $.ajax({
      url: link,
      method: "GET"
    })
    request.done(function(response) {
      $('.login').hide();
      $('.login-link').after(response);
    })
  })

  $(".new-post-link").on("click", function(event) {
    event.preventDefault();
    // console.log("working");
    var link = $(this).attr("href");
    // console.log(link);

    var request = $.ajax({
      url: link,
      method: "GET"
    })
    request.done(function(response) {
      console.log(response);
      $('.post_form').hide();
      $('.new-post-link').after(response);
    })
  })

  $(".comments_link").on("click", function(event) {
    event.preventDefault();
    var link = $(this).attr("href");
    var request = $.ajax({
      url: link,
      method: "GET"
    })
    request.done(function(response) {
      $(".comments_link").hide();
      $(".comment-elements").append(response);
    })
  })

  $(".posts_link").on("click", function(event) {
    event.preventDefault();

    var link = $(this).attr("href");
    var method = 'get';

    var request = $.ajax({
      url: link,
      method: method
    })
    request.done(function(response) {
      $(".posts_link").hide();
      $(".post-elements").append(response);
    })
  })
});






