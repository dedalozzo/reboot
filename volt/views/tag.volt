{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    <div class="banner"><a href="#"><img src="/img/970x180.jpg" /></a></div>

    {% include "partials/navigation/tabs/tag/" %}
    {% include "partials/navigation/tabs.volt" %}
    {% include "partials/navigation/filters.volt" %}

    <div class="ghost gutter">A tag is a keyword or label that categorizes your post with other, similar posts. Using the right tags makes it easier for others to find your contents.</div>

    {% include "partials/list-of-tags.volt" %}

  </div>
{% endblock %}