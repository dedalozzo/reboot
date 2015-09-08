{% extends "partials/navigation/tabs/index.volt" %}
{% block vars %}
  {% if etag is defined %}
    {% set resource = etag.name~'/articles' %}
  {% else %}
    {% set resource = 'articles' %}
  {% endif %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/articles/add' %}
{% endblock %}