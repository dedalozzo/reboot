{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    <div class="banner"><a href="#"><img src="/img/970x180.jpg" /></a></div>

    {% include "partials/navigation/tabs/member/" %}
    {% include "partials/navigation/tabs.volt" %}

    <div class="column-left super">

    {% include "partials/navigation/filters.volt" %}
    {% include "partials/list-of-members.volt" %}

    </div> <!-- /column-left -->

    <aside class="column-right wide-skyscraper">
      <div class="banner"><a href="#"><img src="http://city916.com/Images/160x600.gif" width="160" height="600" /></a></div>
    </aside> <!-- /column-right -->
  </div>
{% endblock %}