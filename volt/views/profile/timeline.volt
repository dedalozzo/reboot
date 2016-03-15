{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  <div class="column-left">

    {% include "partials/list-of-posts.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right">
    {# {% set lastVisit = user.getLastvisit() %} #}
    {# {% set hitsCount = user.getHitsCount() %} #}

    <div class="reputation big">
      <table>
        <tr><td>2345</td></tr>
        <tr><td>REPUTAZIONE</td></tr>
      </table>
    </div>

    {% include "partials/widgets/stats.volt" %}
    <div class="banner"><a href="#"><img src="/img/300x250.gif" /></a></div>

    {#
    <blockquote>
      {% if profile.firstName is defined %}
        Mi chiamo {{ profile.firstName|upper }} {{ profile.lastName|upper }}.
      {% else %}
        {{ profile.username }}
      {% endif %}
      {% if profile.birthday is defined %}
        Ho {{ profile.getAge() }} anni.
      {% endif %}
      Mi sono iscritto il {{ profile.getElapsedTimeSinceRegistration()|lower }}.
      {% if lastVisit != "" %}
        La mia ultima visita risale al {{ lastVisit|lower }}.
      {% endif %}
      Il mio profilo è stato visualizzato {% if hitsCount == 1 %}una volta{% else %}{{ hitsCount }} volte{% endif %}.
    </blockquote>
    #}

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}