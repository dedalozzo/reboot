{% if !(recentTags is empty) %}
<ul class="list vertical gutter padding3">
  <li class="title">Tags recentemente aggiornati</li>
  {% for tag in recentTags %}
  <li><a class="tag" href="//{{ serverName }}/{{ tag[0]|url_encode }}/">{{ tag[0] }}</a><span class="popularity"> × {{ tag[1] }}</span></li>
  {% endfor %}
</ul>
{% endif %}