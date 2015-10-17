<li>
  <button class="btn-link" data-dropdown="#dropdown-filter">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-filter" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% set path = "//"~domainName~'/'~controllerPath~actionPath~'/' %}
      {% for name, value in periods %}
        <li><a href="//{{ path~name }}/">name|minustospace</a></li>
      {% endfor %}
    </ul>
  </div>
</li>