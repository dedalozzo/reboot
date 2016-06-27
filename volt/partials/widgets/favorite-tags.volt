{% if user.isMember() %}
  {% set tags = user.tags %}
  {% if !(tags is empty) %}
  <ul class="list item-tags gutter-minus">
    <li class="title">Tags preferiti</li>
    {% for tag in tags %}
    <li><a class="tag" href="//{{ serverName }}/{{ tag['value'] }}/">{{ tag['value'] }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
{% endif %}