{% if posts is defined %}
  {% set baseUrl = '//'~domainName %}
  {% for post in posts %}
    {% set userUrl = baseUrl~'/'~post.username %}
    <article id="{{ post.id }}">
      <hr class="fade-short">
      <ul class="list item-info">
        <li>{{ post.timestamp }}</li>
        <li>
          <i class="icon-eye-open" title="views"></i>&nbsp;{{ post.hitsCount }}&nbsp;&nbsp;
          <i class="icon-thumbs-up"></i>&nbsp;{{ post.score }}&nbsp;&nbsp;
          <i class="icon-comments"></i>&nbsp;{{ post.repliesCount }}
        </li>
      </ul>
      <section class="item-content">
        <div class="ghost half-gutter">
          <a class="item-img" href="{{ post.url }}"><img class="img-polaroid" src="http://lorempixel.com/g/300/150/technics/{{ loop.index }}"></a>
          <a class="item-title" href="{{ post.url }}">{{ post.title }}</a>
          <div class="item-excerpt">{{ post.excerpt }}</div>
        </div>
        <div class="ghost gutter">
          <ul class="list item-tags">
            <li><a class="tag {{ post.type }}" href="{{ baseUrl~'/'~types[post.type] }}/">{{ types[post.type] }}</a></li>
            {% set tags = post.tags %}
            {% for tag in tags %}
            <li><a class="tag" href="{{ baseUrl }}/{{ tag['value']|url_encode }}/{% if !(controllerRoute is empty) %}{{ types[post.type] }}/{% endif %}">{{ tag['value'] }}</a></li>
            {% endfor %}
            <li class="space"></li>
          </ul>
          {% if showUser is defined %}
          <section class="item-user pull-right">
            <a class="avatar" href="{{ userUrl }}"><img class="img-polaroid" src="{{ post.gravatar }}&s=32" /></a>
            <div class="reputation">
              <table>
                <tr><td>2.345</td></tr>
                <tr><td>REPUTATION</td></tr>
              </table>
            </div>
            <a class="username" href="{{ userUrl }}">{{ post.username }}</a>
          </section>
          {% endif %}
        </div>
      </section>
    </article>
  {% elsefor %}
    <div class="alert alert-info">Siamo spiacenti, la ricerca non ha prodotto alcun risultato.</div>
  {% endfor %}
  {% include "partials/pagination.volt" %}
{% endif %}
