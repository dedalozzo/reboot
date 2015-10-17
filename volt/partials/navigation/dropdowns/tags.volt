<li>
  {% if etag is defined %}
    {% set selectedOption = 'custom tags' %}
  {% elseif actionName === 'interesting' %}
    {% set selectedOption = 'favorite tags' %}
  {% else %}
    {% set selectedOption = 'all tags' %}
  {% endif %}
  <button class="btn-link" data-dropdown="#dropdown-tags">{{ selectedOption }} &blacktriangledown;</button>
  <div id="dropdown-tags" class="dropdown dropdown-relative dropdown-tip">
    <ul class="dropdown-menu">
      {% if resource is defined %}
      <li><a href="//{{ domainName~'/'~resource~'/'~actionRoute }}/">all tags</a></li>
      {% else %}
      <li><a href="//{{ domainName~'/'~actionRoute }}/">all tags</a></li>
      {% endif %}
      <li><a href="{{ uri~'/'~actionRoute }}/">favorite tags</a></li>
      <li><a href="{{ uri~'/'~actionRoute }}/">custom tags</a></li>
    </ul>
  </div>
</li>