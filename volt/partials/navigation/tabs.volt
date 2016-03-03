{# Tabs #}
{{ partial("partials/navigation/tabs/"~controllerName~"/") }}
<ul class="list tabs half-gutter">
  {% if etag is defined %}
    {% set tagRoute = etag.name~'/' %}
    <li><span><a id="{{ etag.id }}" class="btn-star{% if etag.isStarred() %} active{% endif %}" title="add to favorites"><i class="icon-star icon-large"></i></a>&nbsp;<b>{{ etag.name }}</b></span></li>
  {% else %}
    {% set tagRoute = '' %}
  {% endif %}
  <li class="pull-right icon"><a href="//{{ domainName~buttonLink }}" class="icon-th-list icon-large"></a></li>
  <li class="pull-right icon"><a href="//{{ domainName~buttonLink }}" class="icon-th-large icon-large"></a></li>
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
{% set actionRoute = tabs[actionName] %}