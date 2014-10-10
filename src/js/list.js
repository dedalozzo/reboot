//! @file list.js
//! @brief AJAX requests for a list of posts.
//! @author Filippo F. Fadda
//! @copyright 3F s.a.s. di Filippo Fadda

//var ajax = 'ajax.programmazione.me';


function like() {
  $("article > div.item-tools > a:first-child").click(
    function() {
      event.preventDefault();

      var postId = $(this).parents("article").attr("id");
      var like = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/like/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },
        success: function(data) {
          span = like.next();
          votesCount = Number(span.text());

          switch (data) {
            case 1:
              votesCount++;
              like.addClass('active');
              break;
            case 2:
              votesCount--;
              like.removeClass('active');
              break;
            case 0:
              // Unchanged
              break;
            case -1:
              // No user logged in
              break;
          }

          span.text(votesCount);
        }
      });

    }
  );
}


function star() {
  $("a.btn-star").click(
    function() {
      event.preventDefault();

      var tagId = $(this).attr("id");
      var star = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/star/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: tagId },
        success: function(data) {

          switch (data) {
            case 1:
              star.addClass('active');
              break;
            case 2:
              star.removeClass('active');
              break;
            case -1:
              // No user logged in
              break;
          }

        }
      });

    }
  );
}



$(document).ready(
  function() {
    like();
    star();
  }
);