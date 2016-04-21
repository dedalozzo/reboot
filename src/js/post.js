//! @file post.js
//! @brief AJAX requests for a single post.
//! @author Filippo F. Fadda
//! @copyright REINDEX LTD

var api = 'http://api.programmazione.me/';

function like() {
  $("article > section.item-content > ul.item-buttons > li > button.btn-like").click(
    function() {
      event.preventDefault();

      var postId = $(this).parents("article").attr("id");
      var like = $(this);

      alert('PORCA LOCA!');

      $.ajax({
        type: "POST",
        url: api + 'like/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          score = like.closest('ul').find('button.score');
          votesCount = Number(score.text());

          if (data[0])
            switch (data[1]) {
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
            }
          else
            alert(data[1]);

          score.text(votesCount);
        }
      });

    }
  );
}


function star() {
  var btnStar = $("button.btn-star");

  btnStar.click(
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'star/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0])
            switch (data[1]) {
              case 1: // Starred
                btnStar.addClass('active');
                break;
              case 2: // Unstarred
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
  $(document).on('click', '#m-trash',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'move-to-trash/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function restore() {
  $(document).on('click', '#m-undo',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'restore/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function markAsDraft() {

}


function close() {
  $(document).on('click', '#m-close',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'close/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function lock() {
  $(document).on('click', '#m-lock',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'lock/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function unprotect() {
  $(document).on('click', '#m-unprotect',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'unprotect/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function hide() {
  $(document).on('click', '#m-hide',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'hide/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function show() {
  $(document).on('click', '#m-show',
    function() {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'show/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: postId },

        success: function(data) {
          if (data[0]) {
            $("#b-admin").trigger('click');
          }
          else
            alert(data[1]);
        }
      });

    }
  );
}


function buildToolsMenu() {

  $(document).on('click', '#b-admin',
    function() {
      event.preventDefault();
      var postId = $(this).parents("article").attr("id");
      var pippo = $("#dropdown-moderator");

      if (pippo.css('display') == 'block') {
        pippo.load("http://programmazione.me/ajax/moderator-menu/", {id: postId},
          function() {
            var dropdown = $('.dropdown:visible').eq(0),
              trigger = dropdown.data('dropdown-trigger'),
              hOffset = trigger ? parseInt(trigger.attr('data-horizontal-offset') || 0, 10) : null,
              vOffset = trigger ? parseInt(trigger.attr('data-vertical-offset') || 0, 10) : null;

            if (dropdown.length === 0 || !trigger) return;

            // Position the dropdown relative-to-parent...
            if (dropdown.hasClass('dropdown-relative')) {
              dropdown.css({
                left: dropdown.hasClass('dropdown-anchor-right') ?
                trigger.position().left - (dropdown.outerWidth(true) - trigger.outerWidth(true)) - parseInt(trigger.css('margin-right'), 10) + hOffset :
                trigger.position().left + parseInt(trigger.css('margin-left'), 10) + hOffset,
                top: trigger.position().top + trigger.outerHeight(true) - parseInt(trigger.css('margin-top'), 10) + vOffset
              });
            } else {
              // ...or relative to document
              dropdown.css({
                left: dropdown.hasClass('dropdown-anchor-right') ?
                trigger.offset().left - (dropdown.outerWidth() - trigger.outerWidth()) + hOffset : trigger.offset().left + hOffset,
                top: trigger.offset().top + trigger.outerHeight() + vOffset
              });
            }

          });
      }
      else
        pippo.empty();
    });

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
    buildToolsMenu();
  }
);