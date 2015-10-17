<li>
  <button class="btn-link" data-dropdown="#dropdown-types">{{ controllerName === 'index' ? 'all types' : types[controllerName] }} &blacktriangledown;</button>
  <div id="dropdown-types" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
      <li><a href="//{{ domainName~'/'~tagRoute~actionRoute }}/">all types</a></li>
      {% for typeName, typeRoute in types %}
        <li><a href="//{{ domainName~'/'~tagRoute~typeRoute~'/'~actionRoute }}/">{{ typeRoute }}</a></li>
      {% endfor %}
    </ul>
  </div>
</li>