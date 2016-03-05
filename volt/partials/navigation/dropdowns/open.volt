<li>
  <button class="btn-link" data-dropdown="#dropdown-periods">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-open" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% set temp = uri~actionRoute~'/' %}
      <li><a href="{{ temp }}newest/">newest</a></li>
      <li><a href="{{ temp }}active/">active</a></li>
      <li><a href="{{ temp }}popular/">popular</a></li>
    </ul>
  </div>
</li>