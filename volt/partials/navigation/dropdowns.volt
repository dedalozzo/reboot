{# Dropdowns #}
{% set actionPath = menu[actionName] %}
<ul class="list hmenu gutter">
  {{ partial("partials/navigation/tabs/"~controllerName~"/"~tabs[actionName]) }}
</ul>