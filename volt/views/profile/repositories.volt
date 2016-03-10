{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}

  {{ flash.output() }}

  <div class="column-left">

  {% include "partials/navigation/dropdowns.volt" %}

  {% if repos is defined %}
    {% set baseUrl = '//'~domainName %}
    {% for repo in repos %}
      <article id="{{ repo['id'] }}">
        <hr class="fade-short">
        <ul class="list item-info">
          <li>{{ repo['created_at'] }}</li>
          <li>
            <i class="icon-star" title="stargazers"></i>&nbsp;{{ repo['stargazers_count'] }}&nbsp;&nbsp;
            <i class="icon-eye-open" title="watchers"></i>&nbsp;{{ repo['watchers_count'] }}&nbsp;&nbsp;
            <i class="icon-code-fork" title="forks"></i>&nbsp;{{ repo['forks_count'] }}
          </li>
        </ul>
        <section class="item-content">
          <div class="ghost half-gutter">
            <a class="item-title" href="{{ repo['html_url'] }}">{{ repo['name'] }}</a>
            <div class="item-excerpt">{{ repo['description'] }}</div>
          </div>
          <div class="ghost gutter">
            {% if repo['language'] is not empty %}
            <ul class="list item-tags">
              <li><a class="tag" href="{{ baseUrl }}/{{ repo['language']|lower|url_encode }}/">{{ repo['language'] }}</a></li>
              <li class="space"></li>
            </ul>
            {% endif %}
          </div>
        </section>
      </article>
      {% elsefor %}
      <div class="alert alert-info">Siamo spiacenti, la ricerca non ha prodotto alcun risultato.</div>
    {% endfor %}
    {% include "partials/pagination.volt" %}
  {% endif %}

  </div> <!-- /column-left -->

  <div class="column-right">

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}