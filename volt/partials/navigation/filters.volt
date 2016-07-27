{# Filters' bar #}
{% set actionRoute = tabs[actionName] %}
{% if tabs[actionName] is type('array') %}
  {% set actionRoute = tabs[actionName]|current %}
{% else %}
  {% set actionRoute = tabs[actionName] %}
{% endif %}
<ul class="list hmenu gutter">
  {{ partial("partials/navigation/tabs/"~controllerName~"/"~actionRoute) }}
</ul>