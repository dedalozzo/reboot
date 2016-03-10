{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set tabName = 'settings' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  <div class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="ghost gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/password/" id="passwordfrm" name="passwordfrm" method="post" role="form">
        <fieldset>
          <div class="half-gutter">
            <label for="oldPassword">Old password:</label><br>
            {{ password_field("oldPassword", "placeholder": "Old password", 'class': 'half') }}
            <span class="error">{{ validation.first("password") }}</span>
          </div>
          <div class="half-gutter">
            <label for="newPassword">New password:</label><br>
            {{ password_field("newPassword", 'class': 'half') }}
            <span class="error">{{ validation.first("password") }}</span>
          </div>
          <div class="half-gutter">
            <label for="confirmPassword">Confirm password:</label><br>
            {{ password_field("confirmPassword", 'class': 'half') }}
            <span class="error">{{ validation.first("confirmPassword") }}</span>
          </div>
          <div class="align-right">
            <button type="submit" name="update" value="update" class="btn blue">Update</button>
          </div>
        </fieldset>
      </form>
    </div>

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}