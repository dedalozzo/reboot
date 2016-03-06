{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  {{ flash.output() }}

  <div class="column-left compressed">

  </div> <!-- /column-left -->

  <div class="column-right expanded">

    {% if repos is defined %}
    {% set baseUrl = '//'~domainName %}
    {% for repo in repos %}
    {% set userUrl = baseUrl~'/'~entry.username %}
    <article id="{{ repo.id }}">
      <hr class="fade-short">
      <ul class="list item-info">
        <li>{{ repo.created_at }}</li>
        <li>
          <i class="icon-star"></i>&nbsp;{{ repo.stargazers_count }}&nbsp;&nbsp;
          <i class="icon-eye-open"></i>&nbsp;{{ repo.watchers_count }}&nbsp;&nbsp;
          <i class="icon-code-fork"></i>&nbsp;{{ repo.forks_count }}
        </li>
      </ul>
      <section class="item-content">
        <div class="ghost half-gutter">
          <a class="item-title" href="{{ repo.url }}">{{ repo.name }}</a>
          <div class="item-excerpt">{{ repo.description }}</div>
        </div>
        <div class="ghost gutter">
          <ul class="list item-tags">
          </ul>
          <ul class="list item-tags">
            <li><a class="tag {{ entry.type }}" href="{{ baseUrl~'/'~types[entry.type] }}/">{{ types[entry.type] }}</a></li>
            {% set tags = entry.tags %}
            {% for tag in tags %}
            <li><a class="tag" href="{{ baseUrl }}/{{ tag['value']|url_encode }}/{% if !(controllerRoute is empty) %}{{ types[entry.type] }}/{% endif %}">{{ tag['value'] }}</a></li>
            {% endfor %}
            <li class="space"></li>
          </ul>
        </div>
      </section>
    </article>
    {% elsefor %}
    <div class="alert alert-info">Siamo spiacenti, la ricerca non ha prodotto alcun risultato.</div>
    {% endfor %}
    {% include "partials/pagination.volt" %}
    {% endif %}

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}