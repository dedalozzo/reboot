{% if dispatcher.getParam('role') !== null %}
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