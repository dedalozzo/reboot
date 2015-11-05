{# Menu bar #}
<nav class="menubar">
  <ul class="list pills no-gutter">
    <li><a href="//{{ domainName }}"><i class="icon-home"></i>&nbsp;home</a></li>
    {% include 'partials/types.volt' %}
    {% for name, path in types %}
    <li><a {{ name }}" href="//{{ domainName~'/'~path }}/">{{ path }}</a></li>
    {% endfor %}
    <li><a href="//{{ domainName }}/tags/"><i class="icon-tags"></i>&nbsp;tags</a></li>
    <li><a href="//{{ domainName }}/users/"><i class="icon-group"></i>&nbsp;users</a></li>
    <li class="space"></li>
  </ul>
</nav>