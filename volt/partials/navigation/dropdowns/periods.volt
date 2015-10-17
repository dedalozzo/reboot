<li>
  <button class="btn-link" data-dropdown="#dropdown-periods">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-periods" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% for name, value in periods %}
        <li><a href="{{ uri~actionRoute~'/'~name }}/">{{ name|minustospace }}</a></li>
      {% endfor %}
    </ul>
  </div>
</li>