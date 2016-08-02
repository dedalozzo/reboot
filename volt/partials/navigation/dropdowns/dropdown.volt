{%  macro dropdown(label, name, items, uri, actionRoute, prevRoutes = null, nextRoutes = null) %}
  <li>{{ label }}:</li>
  <li>
    <button class="btn-link" data-dropdown="#dropdown-{{ name }}">{{ dispatcher.getParam(name)|minustospace }} &blacktriangledown;</button>
    <div id="dropdown-{{ name }}" class="dropdown dropdown-relative dropdown-tip">
      <ul class="dropdown-menu">
        {% set prefix = uri~actionRoute~'/' %}
        {% if prevRoutes is defined %}
          {% for index, route in prevRoutes %}
            {% set prefix = prefix~route~'/' %}
          {% endfor %}
        {% endif %}
        {% set postfix = '' %}
        {% if nextRoutes is defined %}
          {% for index, route in nextRoutes %}
            {% set postfix = postfix~'/'~route %}
          {% endfor %}
        {% endif %}
        {% for name, value in items %}
          <li><a href="{{ prefix~name~postfix }}/">{{ name|minustospace }}</a></li>
        {% endfor %}
      </ul>
    </div>
  </li>
{% endmacro %}