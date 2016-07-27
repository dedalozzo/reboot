{%  macro dropdown(label, name, items, uri, actionRoute, prevRoutes = null) %}
  <li>{{ label }}:</li>
  <li>
    <button class="btn-link" data-dropdown="#dropdown-{{ name }}">{{ dispatcher.getParam(name)|minustospace }} &blacktriangledown;</button>
    <div id="dropdown-{{ name }}" class="dropdown dropdown-relative dropdown-tip">
      <ul class="dropdown-menu">
        {% set temp = uri~actionRoute~'/' %}
        {% for index, route in prevRoutes %}
          {% set temp = temp~route~'/' %}
        {% endfor %}
        {% for name, value in items %}
          <li><a href="{{ temp~name }}/">{{ name|minustospace }}</a></li>
        {% endfor %}
      </ul>
    </div>
  </li>
{% endmacro %}