//! @file member.js
//! @brief AJAX requests for a list of members.
//! @author Filippo F. Fadda
//! @copyright REINDEX LTD

var api = 'http://api.programmazione.me/';


function addFriend() {
  $("article > section.item-content > div > div > button.btn-icon").click(
    function() {
      event.preventDefault();

      var memberId = $(this).parents("article").attr("id");
      var connect = $(this);

      $.ajax({
        type: "POST",
        url: api + 'addfriend/',
        xhrFields: { withCredentials: true },
        dataType: "json",
        data: { id: memberId },

        success: function(data) {
          if (data[0])
            switch (data[1]) {
              case 1: // Connected
                connect.text('CONNECTED');
                break;
              case 2: // Unconnected
                connect.text('UNCONNECTED');
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
  function() {
    addFriend();
  }
);