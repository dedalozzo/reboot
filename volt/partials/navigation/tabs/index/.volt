{% if etag is defined %}
  {% set tabs = [
  'activeByTag': 'active',
  'popularByTag': 'popular',
  'newestByTag': 'new',
  'infoByTag': 'info'
  ] %}
{% else %}
  {% set tabs = [
  'favorite': 'favorites',
  'active': 'active',
  'popular': 'popular',
  'newest': 'new'
  ] %}
{% endif %}
{% block vars %}
  {% set controllerRoute = '' %}
{% endblock %}