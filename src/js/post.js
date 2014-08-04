//! @file post.js
//! @brief AJAX requests for a single post.
//! @author Filippo F. Fadda
//! @copyright 3F s.a.s. di Filippo Fadda

//var ajax = 'ajax.programmazione.me';

function like() {
  $("article > section.item-content > ul.item-buttons > li > button.btn-like").click(
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
          score = like.closest('ul').find('button.score');
          votesCount = Number(score.text());

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

          score.text(votesCount);
        }
      });

    }
  );
}


function star() {
  $("button.btn-star").click(
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");
      var star = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/star/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },
        success: function(data) {

          switch (data) {
            case 1:
              $("button.btn-star").addClass('active');
              break;
            case 2:
              $("button.btn-star").removeClass('active');
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