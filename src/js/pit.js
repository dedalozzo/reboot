/**
 * Created by fff on 7/5/14.
 */

//var ajax = 'ajax.programmazione.me';

$(document).ready(
  function() {

    // Like
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
);