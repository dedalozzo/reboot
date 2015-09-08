{% if etag is defined %}
  {% set resource = etag.name %}
  {% set menu = [
  'activeByTag': 'active',
  'popularByTag': 'popular',
  'newestByTag': 'new',
  'infoByTag': 'info'
  ] %}
{% else %}
  {% set menu = [
  'favorite': 'favorites',
  'interesting': 'interesting',
  'active': 'active',
  'popular': 'popular',
  'newest': 'new'
  ] %}
{% endif %}
{% block vars %}{% endblock %}