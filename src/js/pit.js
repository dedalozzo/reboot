/**
 * Created by fff on 7/5/14.
 */

//var ajax = 'ajax.programmazione.me';

$(document).ready(
  function() {
    $("article > div.item-tools > a:first-child").click(
      function() {
        event.preventDefault();

        var postId = $(this).parents("article").attr("id");
        var like = $(this);

        $.post('http://ajax.programmazione.me/vota/', {id: postId}, function(data) {
          like.addClass('active');
        });
      }
    );
  }
);