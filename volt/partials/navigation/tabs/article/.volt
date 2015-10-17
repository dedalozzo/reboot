{% extends "partials/navigation/tabs/index/.volt" %}
{% block vars %}
  {% set resource = 'articles' %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/articles/add' %}
{% endblock %}