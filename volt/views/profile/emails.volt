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

    {% include "partials/navigation/settings.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right expanded">
    <div class="ghost gutter">
      <form action="//{{ serverName }}/logon/" id="passwordform" name="passwordform" method="post" role="form">
        <fieldset>
          <div class="half-gutter">
            <label for="email">Add e-mail address:</label><br>
            {{ email_field("email", "placeholder": "E-mail address", 'class': 'half') }}<button type="submit" name="addEmail" value="addEmail" class="btn blue">Save</button>
            {% if addEmail is defined %}<span class="error">{{ validation.first("password") }}</span>{% endif %}
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