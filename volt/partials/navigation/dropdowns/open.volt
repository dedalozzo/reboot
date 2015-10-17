<li>
  <button class="btn-link" data-dropdown="#dropdown-open">{{ dispatcher.getParam('filter') }} &blacktriangledown;</button>
  <div id="dropdown-open" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% set path = "//"~domainName~'/'~controllerPath~actionPath~'/' %}
      <li><a href="//{{ path~'newest' }}/">newest</a></li>
      <li><a href="//{{ path~'active' }}/">active</a></li>
      <li><a href="//{{ path~'popular' }}/">popular</a></li>
    </ul>
  </div>
</li>