{# Submenu #}
{% if submenu is defined  %}
  {% set actionPath = menu[actionName] %}
  <ul class="list hmenu gutter">
    <li>category:</li>
    <li>
      <button class="btn-link" title="category" data-dropdown="#dropdown-cat">{{ controllerName === 'index' ? 'all' : types[controllerName] }} &blacktriangledown;</button>
      <div id="dropdown-cat" class="dropdown dropdown-relative dropdown-tip">
        <ul class="dropdown-menu">
          {% if etag is defined %}
            {% set tagName = etag.name~'/' %}
          {% else %}
            {% set tagName = '' %}
          {% endif %}
          <li><a href="//{{ domainName~'/'~tagName~actionPath }}/">all</a></li>
          {% for name, path in types %}
            <li><a href="//{{ domainName~'/'~tagName~path~'/'~actionPath }}/">{{ path }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </li>
    <li class="space"></li>
    <li>filter&nbsp;by:</li>
    <li>
      <button class="btn-link" title="category" data-dropdown="#dropdown-filter">filter &blacktriangledown;</button>
      <div id="dropdown-filter" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
        <ul class="dropdown-menu">
          {% for filterPath, value in submenu %}
            <li><a href="//{{ domainName~'/'~controllerPath~actionPath~'/'~filterPath }}/">{{ filterPath|minustospace }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </li>
  </ul>
{% endif %}