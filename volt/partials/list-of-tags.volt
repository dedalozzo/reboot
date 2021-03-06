{% if entries is defined %}
  {% for entry in entries %}
    {% set modulus = loop.index % 4 %}
    {% if loop.first %}
      <ul class="list gutter">
    {% endif %}
    <li style="width: 25%;"><a class="tag" href="//{{ serverName }}/{{ entry.name|url_encode }}/">{{ entry.name }}</a><span class="popularity"> × {{ entry.postsCount }}</span><br>{{ entry.excerpt }}</li>
    {% if loop.last %}
      {% for i in 1..modulus  %}
        <li style="width: 25%;"></li>
      {% endfor  %}
      </ul>

      <hr>
    {% elseif (modulus == 0) %}
      </ul>

      <hr>

      <ul class="list gutter">
    {% endif %}
    {% elsefor %}
    <div class="alert alert-info">Sorry, no results were found.</div>
  {% endfor %}
  {% include "partials/pagination.volt" %}
{% endif %}