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

  <aside class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </aside> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="ghost gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/password/" id="passwordfrm" name="passwordfrm" method="post" role="form">
        <fieldset>
          <p class="gutter">La <b>password</b> ti permettere di accedere al tuo profilo utilizzando una qualunque delle e-mail associate al medesimo. Per ragioni di sicurezza scegli una password diversa da quella che usi su altri siti.</p>
          <ul class="list vertical post-it">
            <li class="title">The password should match the following conditions</li>
            <li><i class="icon-caret-right small"></i> deve contenere almeno <span class="keyword">{{ passwordMinLength }}</span> caratteri e al massimo <span class="keyword">{{ passwordMaxLength }}</span></li>
            <li><i class="icon-caret-right small"></i> devono essere presenti almeno <b>un numero</b> ed <b>una lettera</b></li>
          </ul>
          <div class="half-gutter">
            <label for="oldPassword">Old password:</label><br>
            {{ password_field("oldPassword", 'class': 'half') }}
            <span class="error">{{ validation.first("oldPassword") }}</span>
          </div>
          <div class="half-gutter">
            <label for="newPassword">New password:</label><br>
            {{ password_field("newPassword", 'class': 'half') }}
            <span class="error">{{ validation.first("newPassword") }}</span>
          </div>
          <div class="gutter">
            <label for="confirmPassword">Confirm password:</label><br>
            {{ password_field("confirmPassword", 'class': 'half') }}
            <span class="error">{{ validation.first("confirmPassword") }}</span>
          </div>
          <button type="submit" name="update" value="update" class="btn red">CHANGE PASSWORD</button>
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