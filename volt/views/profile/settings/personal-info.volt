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

    {% include "partials/navigation/profile.volt" %}

  </aside> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="ghost gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/" id="pinfofrm" name="pinfofrm" method="post" role="form">
        <fieldset>
          <p class="gutter">Le seguenti <b>informazioni personali</b> sono facoltative. Ti invitiamo comunque a tenerle aggiornate.</p>
          <div class="half-gutter">
            <label for="firstName">First name:</label><br>
            {{ text_field("firstName", "placeholder": "First name", 'class': 'half') }}
            <span class="error">{{ validation.first("firstName") }}</span>
          </div>
          <div class="half-gutter">
            <label for="lastName">Last name:</label><br>
            {{ text_field("lastName", "placeholder": "Last name", 'class': 'half') }}
            <span class="error">{{ validation.first("lastName") }}</span>
          </div>
          <div class="half-gutter">
            <label>Gender:</label><br>
            {{ radio_field('gender', 'value': 'm', 'id': 'male') }}
            <label for="male">Male</label>
            {{ radio_field('gender', 'value': 'f', 'id': 'female') }}
            <label for="female">Female</label>
          </div>
          <div class="gutter">
            <label for="birthday">Birthday:</label><br>
            {{ date_field("birthday", "placeholder": "Last name", 'class': 'date') }}
            <span class="error">{{ validation.first("birthday") }}</span>
          </div>
          <button type="submit" name="update" value="update" class="btn blue">UPDATE PERSONAL INFO</button>
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