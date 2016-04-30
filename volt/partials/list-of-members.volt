{% if members is defined %}
  {% set baseUrl = '//'~domainName~'/' %}
  {% for member in members %}
    {% set modulus = loop.index % 2 %}
    {% set url = baseUrl~member.username %}
    {% if loop.first %}
<ul class="list fifty gutter">
    {% endif %}
  <li>
    <article id="{{ member.id }}">
      <hr class="fade-short">
      <ul class="list item-info">
        <li>{{ member.when }}</li>
        <li>
          <i class="icon-group" title="connections"></i>&nbsp;{{ member.friendsCount }}&nbsp;&nbsp;
          <i class="icon-male" title="followers"></i><i class="icon-male small"></i><i class="icon-male mini"></i>&nbsp;{{ member.followersCount }}
        </li>
        <li><i class="icon-eye-open" title="views"></i>&nbsp;{{ member.hitsCount }}</li>
      </ul>
      <section class="item-content">
        <div class="ghost half-gutter rel">
          <a class="item-img avatar" href="{{ url }}"><img class="img-polaroid" src="{{ member.gravatar }}&s=150" /></a>
          {% if member.fullName|trim is empty %}
            <a class="item-title" href="{{ url }}">{{ member.username }}</a>
          {% else %}
            <a class="item-title" href="{{ url }}">{{ member.fullName }}</a>
            <a class="username" href="{{ url }}">{{ member.username }}</a>
          {% endif %}
          <div class="item-excerpt">{{ member.headline }}</div>
          {% if member.friendshipExists %}
            <div class="align-right anchor-rb">
              <i class="icon-ok"></i> CONNECTION
            </div>
          {% else %}
            <div class="align-right anchor-rb">
              <button class="btn btn-icon blue mini pull-right"><i class="icon-plus"></i> CONNECT</button>
            </div>
          {% endif %}
        </div>
        <div class="ghost">
          <ul class="list item-tags">
            <li><a class="tag" href="//programmazione.me/p.it/">php</a></li>
            <li><a class="tag" href="//programmazione.me/p.it/">rust</a></li>
            <li><a class="tag" href="//programmazione.me/p.it/">scala</a></li>
            <li><a class="tag" href="//programmazione.me/p.it/">swift</a></li>
            <li><a class="tag" href="//programmazione.me/p.it/">couchdb</a></li>
            <li class="space"></li>
          </ul>
        </div>
      </section>
    </article>
  </li>
    {% if loop.last %}
      {% for i in 1..modulus  %}
    <li></li>
      {% endfor  %}
</ul>

    {% elseif (modulus == 0) %}
</ul>

<ul class="list fifty gutter">
    {% endif %}
  {% elsefor %}
  <div class="alert alert-info">Siamo spiacenti, la ricerca non ha prodotto alcun risultato.</div>
  {% endfor %}
  {% include "partials/pagination.volt" %}
{% endif %}