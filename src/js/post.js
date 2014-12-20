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
            case 1: // Registered
              votesCount++;
              like.addClass('active');
              break;
            case 2: // Deleted
              votesCount--;
              like.removeClass('active');
              break;
            case 3: // Replaced
              // Can't occour in case of a Like.
              break;
            default: // Error
              alert(data);
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
      //var star = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/star/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },
        success: function(data) {

          switch (data) {
            case 1: // Starred
              $("button.btn-star").addClass('active');
              break;
            case 2: // Unstarred
              $("button.btn-star").removeClass('active');
              break;
            default: // Error
              alert(data);
          }

        }
      });

    }
  );
}


function submit() {

}


function approve() {

}


function returnForRevision() {

}


function reject() {

}


function revert() {

}


function moveToTrash() {
  $("button.btn-star").click(
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");
      //var star = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/move-to-trash/',
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


function restore() {
  $("button.btn-star").click(
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");
      //var star = $(this);

      $.ajax({
        type: "POST",
        url: 'http://ajax.programmazione.me/restore/',
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


function markAsDraft() {

}


function close() {

}


function lock() {

}


function unprotect() {

}


function hide() {

}


function show() {

}


$(document).ready(
  function() {
    like();
    star();
    submit();
    approve();
    returnForRevision();
    reject();
    revert();
    moveToTrash();
    restore();
    markAsDraft();
    close();
    lock();
    unprotect();
    hide();
    show();
  }
);