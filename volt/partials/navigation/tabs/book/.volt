{% extends "partials/navigation/tabs/index/.volt" %}
{% block vars %}
  {% set resource = 'books' %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/books/add' %}
{% endblock %}