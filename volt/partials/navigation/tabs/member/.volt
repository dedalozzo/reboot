{% if role is defined %}
  {% set tabs = [
  'reputation': 'reputation',
  'popular': 'popular',
  'newestByRole': 'new'
  ] %}
{% else %}
  {% set tabs = [
  'reputation': 'reputation',
  'popular': 'popular',
  'newest': 'new'
  ] %}
{% endif %}
{% set controllerRoute = 'users/' %}