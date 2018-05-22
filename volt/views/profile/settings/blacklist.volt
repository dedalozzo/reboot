{% extends "templates/base.volt" %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set tabName = 'settings' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}

  <aside class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </aside> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="ghost gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/blacklist/" id="blacklistfrm" name="blacklistfrm" method="post" role="form">
        <fieldset>
          <p class="gutter">Your <b>blacklist</b> is used to prevent other users to interact with you. Every user listed in your blacklist can't contact you, neither he can add you as friend.</p>
          <table id="blacklist" class="std gutter">
            <tbody>
            {% set blacklist = user.blacklist.asArray() %}
            {% for member in blacklist %}
              <tr>
                <td><a class="avatar" href="//{{ serverName }}/{{ member['value'][0] }}"><img class="img-polaroid" src="{{ profile.getGravatar(member['value'][1]) }}&s=24" /></a></td>
                <td width="30%"><a href="//{{ serverName }}/{{ member['value'][0] }}">{{ member['value'][0] }}</a></td>
                <td width="70%">{{ member['value'][3]~' '~member['value'][4] }}</td>
                <td><button name="removeMember" type="submit" value="{{ member['value'][0] }}" class="btn btn-icon red" title="remove user"><i class="icon-trash icon-large"></i></button></td>
              </tr>
            {% endfor %}
            </tbody>
          </table>
          <div class="gutter">
            <label for="nickname">Add an user to the blacklist:</label><br>
            {{ text_field("nickname", "placeholder": "username", 'class': 'half') }}
            <span class="error">{{ validation.first("nickname") }}</span>
          </div>
          <button name="addMember" type="submit" value="addMember" class="btn blue">ADD TO BLACKLIST</button>
        </fieldset>
      </form>
    </div>

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block footer %}
  {% include "partials/navigation/footer.volt" %}
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}