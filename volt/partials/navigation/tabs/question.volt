{% if etag is defined %}
  {% set menu = [
  'activeByTag': 'active',
  'popularByTag': 'popular',
  'newestByTag': 'new',
  'openByTag': 'open',
  'importantByTag': 'important',
  'infoByTag': 'info'
  ] %}
  {% set resource = etag.name~'/questions' %}
{% else %}
  {% set menu = [
  'favorite': 'favorites',
  'interesting': 'interesting',
  'active': 'active',
  'popular': 'popular',
  'newest': 'new',
  'open': 'open',
  'important': 'important'
  ] %}
  {% set resource = 'questions' %}
{% endif %}
{% set buttonLabel = 'new' %}
{% set buttonLink = '/questions/add' %}