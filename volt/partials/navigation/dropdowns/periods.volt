{%  macro dropdown(name, items) %}
<li>
  <button class="btn-link" data-dropdown="#dropdown-periods">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-{{ name }}" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
    {% set temp = uri~actionRoute~'/' %}
    {% for name, value in items %}
      <li><a href="{{ temp~name }}/">{{ name|minustospace }}</a></li>
    {% endfor %}
    </ul>
  </div>
</li>
{% endmacro %}