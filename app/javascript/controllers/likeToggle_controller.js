import $ from "jquery";

$(document).on("turbolinks:load", function() {
  console.log("AAAAAA")
  $(".like-toggle").click( () => {
    var button = $(".like-toggle");
    console.log(`LIKE CLICADO ${button.attr("id")}`);
    $.ajax({
      type: "POST",
      url: `/user/posts/${button.attr("id")}/like_toggle`,
      success: function (data) {
        toggleButton(button, data);
      }
    });
  });
  
  function toggleButton (button, data) {
    var buttonIcon = button.children().first();
    if (data.liked == true) {
      buttonIcon.css("color", "blue");
    } else {
      buttonIcon.css("color", "white")
    }
    button.next().html(data.likesCount);
  };
});