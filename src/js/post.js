//! @file post.js
//! @brief AJAX requests for a single post.
//! @author Filippo F. Fadda
//! @copyright REINDEX LTD

var api = 'http://programmazione.me/api/';


function like(event) {
  $("section.item-content > ul.item-buttons > li > button.like").click(
    function(event) {
      event.preventDefault();

      var postId = $(this).parents("article").attr("id");
      var like = $(this);

      $.ajax({
        type: "POST",
        url: api + 'post/like/',
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


function moveToTrash(event) {
  $(document).on('click', '#m-trash',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/move-to-trash/',
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


function restore(event) {
  $(document).on('click', '#m-undo',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/restore/',
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


function close(event) {
  $(document).on('click', '#m-close',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/close/',
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


function lock(event) {
  $(document).on('click', '#m-lock',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/lock/',
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


function unprotect(event) {
  $(document).on('click', '#m-unprotect',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/unprotect/',
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


function hide(event) {
  $(document).on('click', '#m-hide',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/hide/',
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


function show(event) {
  $(document).on('click', '#m-show',
    function(event) {
      event.preventDefault();

      var postId = $("article").attr("id");

      $.ajax({
        type: "POST",
        url: api + 'post/show/',
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


function buildToolsMenu(event) {

  $(document).on('click', '#b-admin',
    function(event) {
      event.preventDefault();
      var postId = $(this).parents("article").attr("id");
      var menu = $("#dropdown-moderator");

      if (menu.css('display') == 'block') {
        menu.load("http://programmazione.me/ajax/moderator-menu/", {id: postId},
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
        menu.empty();
    });

}


$(document).ready(
  function(event) {
    like(event);
    moveToTrash(event);
    restore(event);
    close(event);
    lock(event);
    unprotect(event);
    hide(event);
    show(event);
    buildToolsMenu(event);
  }
);