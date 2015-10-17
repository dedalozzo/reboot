<li>
  <button class="btn-link" data-dropdown="#dropdown-filter">{{ dispatcher.getParam('filter')|minustospace }} &blacktriangledown;</button>
  <div id="dropdown-filter" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% set path = "//"~domainName~'/'~controllerPath~actionPath~'/' %}
      <li><a href="//{{ path~'posting-date' }}/">posting date</a></li>
      <li><a href="//{{ path~'insertion-date' }}/">insertion date</a></li>
    </ul>
  </div>
</li>