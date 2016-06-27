{% if etag is defined %}
  {% set tabs = [
  'infoByTag': 'info',
  'newestByTag': 'new',
  'popularByTag': 'popular',
  'activeByTag': 'active'
  ] %}
{% else %}
  {% set tabs = [
  'newest': 'new',
  'popular': 'popular',
  'active': 'active'
  ] %}
{% endif %}
{% block vars %}
  {% set controllerRoute = '' %}
{% endblock %}