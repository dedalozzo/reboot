{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    {% include "partials/navigation/tabs.volt" %}

    <div class="column-left">
      {% set showUser = TRUE %}
      {% include "partials/navigation/dropdowns.volt" %}
      {% include "partials/list-of-posts.volt" %}
    </div> <!-- /column-left -->

    <aside class="column-right">
      {% include "partials/widgets/stats.volt" %}
      <div class="banner"><a href="#"><img src="/img/300x250.gif" /></a></div>
      {% include "partials/widgets/last-updates.volt" %}
      {% include "partials/widgets/favorite-tags.volt" %}
      {% include "partials/widgets/recent-tags.volt" %}
      <div class="banner"><a href="#"><img src="/img/300x250cro.jpeg" /></a></div>
    </aside> <!-- /column-right -->
  </div> <!-- /content -->
{% endblock %}