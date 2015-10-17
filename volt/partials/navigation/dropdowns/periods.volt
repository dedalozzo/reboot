<li>
  <button class="btn-link" data-dropdown="#dropdown-periods">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-periods" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
    {% set temp = uri~actionRoute~'/' %}
    {% for name, value in filters %}
      <li><a href="{{ temp~name }}/">{{ name|minustospace }}</a></li>
    {% endfor %}
    </ul>
  </div>
</li>