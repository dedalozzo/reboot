{% if etag is defined %}
  {% set tabs = [
  'infoByTag': 'info',
  'importantByTag': 'important',
  'openByTag': 'open',
  'newestByTag': 'new',
  'popularByTag': 'popular',
  'activeByTag': 'active'
  ] %}
{% else %}
  {% set tabs = [
  'open': 'open',
  'newest': 'new',
  'popular': 'popular',
  'active': 'active',
  'favorite': ['favorites']
  ] %}
{% endif %}
{% set controllerRoute = 'questions/' %}