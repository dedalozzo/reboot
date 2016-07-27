{%  macro dropdown(label, name, filters, uri, actionRoute) %}
<li>{{ label }}:</li>
<li>
  <button class="btn-link" data-dropdown="#dropdown-{{ name }}">{{ dispatcher.getParam(name)|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-{{ name }}" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
    {% set temp = uri~actionRoute~'/' %}
    {% for name, value in filters %}
      <li><a href="{{ temp~name }}/">{{ name|minustospace }}</a></li>
    {% endfor %}
    </ul>
  </div>
</li>
{% endmacro %}