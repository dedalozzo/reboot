{% if etag is defined %}
  {% set tabs = [
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
  'active': 'active'
  ] %}
{% endif %}
{% set controllerRoute = 'questions/' %}