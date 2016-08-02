{%  macro dropdown(label, name, items, uri, actionRoute, prevRoutes = [], nextRoutes = []) %}
  <li>{{ label }}:</li>
  <li>
    <button class="btn-link" data-dropdown="#dropdown-{{ name }}">{{ dispatcher.getParam(name)|minustospace }} &blacktriangledown;</button>
    <div id="dropdown-{{ name }}" class="dropdown dropdown-relative dropdown-tip">
      <ul class="dropdown-menu">
        {% set prefix = uri~actionRoute~'/' %}
        {% for index, route in prevRoutes %}
          {% set prefix = prefix~route~'/' %}
        {% endfor %}
        {% set postfix = '' %}
        {% for index, route in nextRoutes %}
          {% set postfix = postfix~'/'~route %}
        {% endfor %}
        {% for name, value in items %}
          <li><a href="{{ prefix~name~postfix }}/">{{ name|minustospace }}</a></li>
        {% endfor %}
      </ul>
    </div>
  </li>
{% endmacro %}