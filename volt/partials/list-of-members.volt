{% if entries is defined %}
  {% set baseUrl = '//'~domainName~'/users/' %}
  {% for entry in entries %}
    {% set url = baseUrl~entry.username %}
    <article id="{{ entry.id }}">
      <hr class="fade-short">
      <ul class="list item-info">
        <li>{{ entry.when }}</li>
        <li>
          <i class="icon-group" title="following"></i> 0
          <i class="icon-male" title="followers"></i><i class="icon-male small"></i><i class="icon-male mini"></i>&nbsp;{{ entry.followersCount }}
        </li>
        <li><i class="icon-eye-open" title="views"></i>&nbsp;0</li>
      </ul>
      <section class="item-content">
        <div class="ghost half-gutter rel">
          <a class="item-img avatar" href="{{ url }}"><img class="img-polaroid" src="{{ entry.gravatar }}&s=150" /></a>
          {% if entry.fullName|trim is empty %}
            <a class="item-title" href="{{ url }}">{{ entry.username }}</a>
          {% else %}
            <a class="item-title" href="{{ url }}">{{ entry.fullName }}</a>
            <a class="username" href="{{ url }}">{{ entry.username }}</a>
          {% endif %}
          <div class="item-excerpt">{{ entry.headline }}</div>
          {% if entry.friendshipExists %}
            <div class="align-right anchor-rb">
              <button class="btn btn-icon blue mini pull-right"><i class="icon-minus"></i> UNFOLLOW</button>
            </div>
          {% elseif !user.match(entry.id) %}
            <div class="align-right anchor-rb">
              <button class="btn btn-icon blue mini pull-right"><i class="icon-plus"></i> FOLLOW</button>
            </div>
          {% endif %}
        </div>
        <div class="ghost">
          <ul class="list item-tags">
            <li><a class="tag" href="//reindex.local/p.it/">php</a></li>
            <li><a class="tag" href="//reindex.local/p.it/">rust</a></li>
            <li><a class="tag" href="//reindex.local/p.it/">scala</a></li>
            <li><a class="tag" href="//reindex.local/p.it/">swift</a></li>
            <li><a class="tag" href="//reindex.local/p.it/">couchdb</a></li>
            <li class="space"></li>
          </ul>
        </div>
      </section>
    </article>
  {% elsefor %}
    <div class="alert alert-info">Sorry, no results were found.</div>
  {% endfor %}
  {% include "partials/pagination.volt" %}
{% endif %}
