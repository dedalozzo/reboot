{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set controllerPath = '/' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  {{ flash.output() }}

  <div class="column-left compressed">

    <ul class="list vertical rabs half-gutter">
      <li><a href="//programmazione.me/Dedalo/timeline/">General</a></li>
      <li class="active"><a href="//programmazione.me/Dedalo/about/">Account Settings</a></li>
      <li><a href="//programmazione.me/Dedalo/about/">Logins</a></li>
      <li><a href="//programmazione.me/Dedalo/connections/">Emails</a></li>
      <li class="space" style="height: 100%;"></li>
    </ul>

  </div> <!-- /column-left -->

  <div class="column-right expanded">

    <div>
      <form action="//{{ serverName }}/logon/" id="signupform" name="signupform" method="post" role="form">
        <div class="half-gutter">
          {{ text_field("firstName", "placeholder": "First name") }}
          {% if signup is defined %}<span class="error">{{ validation.first("firstName") }}</span>{% endif %}
        </div>
        <div class="half-gutter">
          {{ text_field("lastName", "placeholder": "Last name") }}
          {% if signup is defined %}<span class="error">{{ validation.first("lastName") }}</span>{% endif %}
        </div>
        <div class="half-gutter">
          {{ radio_field('gender', 'value': 'Male', 'id': 'male') }}
          {{ radio_field('gender', 'value': 'Female', 'id': 'female') }}
        </div>
        <div class="half-gutter">
          {{ date_field("birthday", "placeholder": "Last name") }}
          {% if signup is defined %}<span class="error">{{ validation.first("birthday") }}</span>{% endif %}
        </div>
        <div class="align-right">
          <button type="submit" name="signup" value="signup" class="btn blue">Save</button>
        </div>
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