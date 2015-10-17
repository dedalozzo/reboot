<li>
  <button class="btn-link" data-dropdown="#dropdown-types">{{ controllerName === 'index' ? 'all types' : types[controllerName] }} &blacktriangledown;</button>
  <div id="dropdown-types" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
      {% if etag is defined %}
        {% set tagName = etag.name %}
      {% else %}
        {% set tagName = '' %}
      {% endif %}
      <li><a href="{{ site~'/'~tagName~'/'~actionRoute }}/">all types</a></li>
      {% for name, route in types %}
        <li><a href="//{{ site~'/'~tagName~'/'~route~'/'~actionRoute }}/">{{ route }}</a></li>
      {% endfor %}
    </ul>
  </div>
</li>