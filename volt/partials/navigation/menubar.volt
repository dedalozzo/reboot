{# Menu bar #}
<nav class="menubar">
  <ul class="list pills no-gutter">
    <li{% if controllerName === 'index' %} class="active"{% endif %}><a href="//{{ domainName }}"><i class="icon-home"></i>&nbsp;home</a></li>
    <li{% if controllerName === 'update' %} class="active"{% endif %}><a href="//{{ domainName }}/updates/"><i class="icon-fire"></i>&nbsp;updates</a></li>
    <li{% if controllerName === 'question' %} class="active"{% endif %}><a href="//{{ domainName }}/questions/"><i class="icon-question"></i>&nbsp;questions</a></li>
    <li{% if controllerName === 'article' %} class="active"{% endif %}><a href="//{{ domainName }}/articles/"><i class="icon-file-text"></i>&nbsp;articles</a></li>
    <li{% if controllerName === 'tag' %} class="active"{% endif %}><a href="//{{ domainName }}/tags/"><i class="icon-tags"></i>&nbsp;tags</a></li>
    <li{% if controllerName === 'user' %} class="active"{% endif %}><a href="//{{ domainName }}/users/"><i class="icon-group"></i>&nbsp;users</a></li>
    <li class="space"></li>
  </ul>
</nav>