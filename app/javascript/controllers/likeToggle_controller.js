import $ from "jquery";
console.log("AAAAAAAA");
window.addEventListener("turbolinks:load", function() {
  console.log("BBBBBBB");
  
  $(".like-toggle").click( () => {
    var button = $(this);
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
  }
});