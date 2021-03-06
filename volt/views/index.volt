{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    <!-- <div class="banner"><a href="#"><img src="/img/970x180.jpg" /></a></div> -->

    {% include "partials/navigation/tabs.volt" %}

    <div class="column-left">
      {% set showUser = TRUE %}
      {% include "partials/navigation/filters.volt" %}
      {% include "partials/list-of-posts.volt" %}
    </div> <!-- /column-left -->

    <aside class="column-right">
      {% include "partials/widgets/stats.volt" %}
      <div class="banner"><a href="#"><img src="/img/300x250.gif" /></a></div>
      {% include "partials/widgets/favorite-tags.volt" %}
      {% include "partials/widgets/recent-tags.volt" %}
      <div class="banner"><a href="#"><img src="/img/300x250cro.jpeg" /></a></div>
      {% include "partials/navigation/footer-right.volt" %}
    </aside> <!-- /column-right -->
  </div> <!-- /content -->
{% endblock %}