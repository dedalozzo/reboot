<li>
  <button class="btn-link" data-dropdown="#dropdown-types">{{ controllerName === 'index' ? 'all types' : types[controllerName] }} &blacktriangledown;</button>
  <div id="dropdown-types" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
      {% if etag is defined %}
        {% set tagRoute = '/'~etag.name %}
      {% else %}
        {% set tagRoute = '/' %}
      {% endif %}
      <li><a href="//{{ domainName~tagRoute~'/'~actionRoute }}/">all types</a></li>
      {% for name, route in types %}
        <li><a href="//{{ domainName~tagRoute~'/'~route~'/'~actionRoute }}/">{{ route }}</a></li>
      {% endfor %}
    </ul>
  </div>
</li>