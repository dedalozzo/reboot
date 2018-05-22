//! @file list.js
//! @brief AJAX requests for a list of posts.
//! @author Filippo F. Fadda
//! @copyright REINDEX LTD

var api = 'http://reindex.local/api/';

/*
function like(event) {
  $("article > div.item-tools > a:first-child").click(
    function(event) {
      event.preventDefault();

      var postId = $(this).parents("article").attr("id");
      var like = $(this);

      $.ajax({
        type: "POST",
        url: api + 'like/',
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
*/


function star(event) {
  var btnStar = $("a.btn-star");

  btnStar.click(
    function(event) {
      event.preventDefault();

      var tagId = $(this).attr("id");

      $.ajax({
        type: "POST",
        url: api + 'tag/star/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: tagId },
        success: function(data) {
          if (data[0])
            switch (data[1]) {
              case 1: // Starred.
                btnStar.addClass('active');
                break;
              case -1: // Unstarred.
                btnStar.removeClass('active');
                break;
            }
          else
            alert(data[1]);
        }
      });

    }
  );
}


$(document).ready(
  function(event) {
    //like(event);
    star(event);
  }
);