{% if etag is defined %}
  {% set tabs = [
  'activeByTag': 'active',
  'popularByTag': 'popular',
  'newestByTag': 'new',
  'openByTag': 'open',
  'importantByTag': 'important',
  'infoByTag': 'info'
  ] %}
{% else %}
  {% set tabs = [
  'favorite': 'favorites',
  'active': 'active',
  'popular': 'popular',
  'newest': 'new',
  'open': 'open'
  ] %}
{% endif %}
{% set resource = 'questions' %}
{% set buttonLabel = 'new' %}
{% set buttonLink = '/questions/add' %}