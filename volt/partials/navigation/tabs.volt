{# Tabs #}
{{ partial("partials/navigation/tabs/"~controllerName~"/") }}
<ul class="list tabs {{ tabName === actionName ? 'half-gutter' : 'gutter'}}">
  <li{{ (actionName === 'index' and controllerName === 'index') ? ' class="active"' : '' }}><a href="{{ uri }}/">Home</a></li>
  {% if etag is defined %}
    {% set tagRoute = etag.name~'/' %}
    <li><a id="{{ etag.id }}" class="{% if actionName === 'info' %}active{% endif %}"><i class="icon-star icon-large"></i>&nbsp;{{ etag.name }}</a></li>
  {% else %}
    {% set tagRoute = '' %}
  {% endif %}
  {% set uri = '//'~domainName~'/'~tagRoute~controllerRoute %}
  {% for name, actionRoute in tabs %}
    {% if actionRoute is type('array') %}
      {% if not user.match(profile.id) %}
        {% continue %}
      {% else %}
        {% set actionRoute = actionRoute|current %}
      {% endif %}
    {% endif %}
    <li{{ (name === tabName) ? ' class="active"' : '' }}><a href="{{ uri~actionRoute }}/">{{ actionRoute|right_trim('/') }}</a></li>
  {% endfor %}
</ul>