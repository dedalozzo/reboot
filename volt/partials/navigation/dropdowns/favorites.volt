<li>
  <button class="btn-link" data-dropdown="#dropdown-favorites">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-favorites" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
    {% set temp = uri~actionRoute~'/' %}
    {% for name, value in periods %}
      <li><a href="{{ temp~name }}/">{{ name|minustospace }}</a></li>
    {% endfor %}
    </ul>
  </div>
</li>