{% if user.isMember() %}
  {% set tags = user.tags.names() %}
  {% if !(tags is empty) %}
  <ul class="list item-tags gutter-minus">
    <li class="title">Favorite tags</li>
    {% for tag in tags %}
    <li><a class="tag" href="//{{ serverName }}/{{ tag['value']|url_encode }}/">{{ tag['value'] }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
{% endif %}