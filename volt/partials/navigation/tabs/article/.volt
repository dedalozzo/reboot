{% extends "partials/navigation/tabs/index/.volt" %}
{% block vars %}
  {% set controllerRoute = 'articles/' %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/articles/add' %}
{% endblock %}