{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    <div class="banner"><a href="#"><img src="/img/970x180.jpg" /></a></div>

    {% include "partials/navigation/tabs/member/" %}
    {% include "partials/navigation/tabs.volt" %}

    <div class="column-left">
    {% include "partials/navigation/filters.volt" %}
    {% include "partials/list-of-members.volt" %}
    </div> <!-- /column-left -->

    <aside class="column-right">
      <div class="banner"><a href="#"><img src="/img/300x250cro.jpeg" /></a></div>
    </aside> <!-- /column-right -->
  </div>
{% endblock %}