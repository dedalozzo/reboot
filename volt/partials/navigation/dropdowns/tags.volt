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