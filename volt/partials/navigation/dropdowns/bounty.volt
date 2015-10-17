<li>
  <button class="btn-link" data-dropdown="#dropdown-filter">{{ dispatcher.getParam('filter') }} &blacktriangledown;</button>
  <div id="dropdown-filter" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
    <ul class="dropdown-menu">
      {% set path = "//"~domainName~'/'~controllerPath~actionPath~'/' %}
      <li><a href="//{{ path~'newest' }}/">newest</a></li>
      <li><a href="//{{ path~'active' }}/">popular</a></li>
      <li><a href="//{{ path~'popular' }}/">ending</a></li>
      <li><a href="//{{ path~'popular' }}/">recently active</a></li>
      <li><a href="//{{ path~'popular' }}/">bounty size</a></li>
    </ul>
  </div>
</li>