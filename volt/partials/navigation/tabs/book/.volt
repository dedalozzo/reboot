{% extends "partials/navigation/tabs/index/.volt" %}
{% block vars %}
  {% set controllerRoute = 'books/' %}
  {% set buttonLabel = 'new' %}
  {% set buttonLink = '/books/add' %}
{% endblock %}