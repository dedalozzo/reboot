{# Tabs #}
{{ partial("partials/navigation/tabs/"~controllerName~"/") }}
<ul class="list tabs {{ tabName === actionName ? 'half-gutter' : 'gutter'}}">
  <li{{ (actionName === 'index' and controllerName === 'index') ? ' class="active"' : '' }}><a href="//{{ domainName }}"><i class="icon-home icon-large"></i>&nbsp;Home</a></li>
  {% if etag is defined %}
    {% set tagRoute = etag.name~'/' %}
    <li><span><a id="{{ etag.id }}" class="btn-star{% if user.tags.exists(etag.unversionId) %} active{% endif %}" title="add to favorites"><i class="icon-star icon-large"></i></a>&nbsp;<a class="tag" href="{{ '//'~domainName~'/'~tagRoute }}">{{ etag.name }}</a></span></li>
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