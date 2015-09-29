{# Submenu #}
{% if submenu is defined  %}
  {% set actionPath = menu[actionName] %}
  <ul class="list hmenu gutter">
    <li>
      {% if etag is defined %}
        {% set tagsValue = 'custom tags' %}
      {% elseif actionName === 'interesting' %}
        {% set tagsValue = 'favorite tags' %}
      {% else %}
        {% set tagsValue = 'all tags' %}
      {% endif %}
      <button class="btn-link" data-dropdown="#dropdown-tags">{{ tagsValue }} &blacktriangledown;</button>
      <div id="dropdown-tags" class="dropdown dropdown-relative dropdown-tip">
        <ul class="dropdown-menu">
          <li><a href="//{{ domainName~'/'~resource~'/'~actionPath }}/">all tags</a></li>
          <li><a href="//{{ domainName~'/'~controllerPath~actionPath }}/">favorite tags</a></li>
          <li><a href="//{{ domainName~'/'~controllerPath~actionPath }}/">custom tags</a></li>
        </ul>
      </div>
    </li>
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
    <li class="space"></li>
    <li>
      <button class="btn-link" data-dropdown="#dropdown-filter">{{ submenuIndex|minustospace }} &blacktriangledown;</button>
      <div id="dropdown-filter" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
        <ul class="dropdown-menu">
          {% for name, value in submenu %}
            <li><a href="//{{ domainName~'/'~controllerPath~actionPath~'/'~name }}/">{{ name|minustospace }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </li>
  </ul>
{% endif %}