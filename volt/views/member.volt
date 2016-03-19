{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
  {% include "partials/navigation/tabs/member/" %}
  {% include "partials/navigation/tabs.volt" %}

    <div class="column-left super">

    {% include "partials/navigation/dropdowns.volt" %}

    {% if members is defined %}
      {% for member in members %}
        {% set modulus = loop.index % 2 %}
        {% set url = '//'~domainName~'/'~member.username %}
        {% if loop.first %}
        <ul class="list fifty gutter">
        {% endif %}
          <li>
            <article id="{{ member.id }}">
              <hr class="fade-short">
              <ul class="list item-info">
                <li>{{ member.when }}</li>
                <li>
                  <i class="icon-group" title="connections"></i>&nbsp;570&nbsp;&nbsp;
                  <i class="icon-male" title="followers"></i><i class="icon-male small"></i><i class="icon-male mini"></i>&nbsp;892
                </li>
                <li><i class="icon-eye-open" title="views"></i>&nbsp;{{ member.hitsCount }}</li>
              </ul>
              <section class="item-content">
                <div class="ghost half-gutter" style="position: relative">
                  <a class="item-img avatar" href="{{ url }}"><img class="img-polaroid" src="{{ member.gravatar }}&s=150" /></a>
                  {% if member.fullName|trim is empty %}
                  <a class="item-title" href="{{ url }}">{{ member.username }}</a>
                  {% else %}
                  <a class="item-title" href="{{ url }}">{{ member.fullName }}</a>
                  <a class="username" href="{{ url }}">{{ member.username }}</a>
                  {% endif %}
                  <div class="item-excerpt">{{ member.headline }}</div>
                  <div class="align-right anchor-rb">
                    <button class="btn blue mini push-right">CONNECT</button><button class="btn blue mini">FOLLOW</button>
                  </div>
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

    </div> <!-- /column-left -->

    <aside class="column-right wide-skyscraper">
      <div class="banner"><a href="#"><img src="http://city916.com/Images/160x600.gif" width="160" height="600" /></a></div>
    </aside> <!-- /column-right -->
  </div>
{% endblock %}