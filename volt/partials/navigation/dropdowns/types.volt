<li>
  <button class="btn-link" data-dropdown="#dropdown-cat">{{ controllerName === 'index' ? 'all types' : types[controllerName] }} &blacktriangledown;</button>
  <div id="dropdown-cat" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
      {% if etag is defined %}
        {% set tagName = etag.name~'/' %}
      {% else %}
        {% set tagName = '' %}
      {% endif %}
      <li><a href="//{{ domainName~'/'~tagName~actionPath }}/">all types</a></li>
      {% for name, path in types %}
        <li><a href="//{{ domainName~'/'~tagName~path~'/'~actionPath }}/">{{ path }}</a></li>
      {% endfor %}
    </ul>
  </div>
</li>