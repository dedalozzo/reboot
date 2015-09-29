{% if etag is defined %}
  {% set menu = [
  'activeByTag': 'active',
  'popularByTag': 'popular',
  'newestByTag': 'new',
  'infoByTag': 'info'
  ] %}
{% else %}
  {% set menu = [
  'favorite': 'favorites',
  'active': 'active',
  'popular': 'popular',
  'newest': 'new'
  ] %}
{% endif %}
{% block vars %}{% endblock %}