{% extends "partials/navigation/tabs/index.volt" %}
{% block vars %}
  {% if etag is defined %}
    {% set resource = etag.name~'/books' %}
  {% else %}
    {% set resource = 'books' %}
  {% endif %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/books/add' %}
{% endblock %}