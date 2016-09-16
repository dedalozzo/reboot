{% extends "templates/base.volt" %}

{% block content %}
<div id="content">
  {% include "partials/types.volt" %}
  {% set baseUrl = '//'~domainName~'/' %}
  {% set userUrl = baseUrl~post.username %}
  {% set score = post.votes.count() %}
  {% set repliesCount = post.getCommentsCount() %}

  <div id="page-title">{{ post.title }}</div>
  <hr class="fade-long">
  <div class="column-left">

    <article id="{{ post.id }}">
      <section class="item-content">
        <ul class="list item-info">
          <li>{{ post.state.equal('CURRENT') ? post.whenHasBeenPublished() : post.whenHasBeenCreated() }}</li>
          <li>
            <i class="icon-facebook" title="facebook"></i>&nbsp;0&nbsp;&nbsp;
            <i class="icon-twitter" title="twitter"></i>&nbsp;0&nbsp;&nbsp;
            <i class="icon-google-plus" title="google+"></i>&nbsp;0&nbsp;&nbsp;
            <i class="icon-mail-forward" title="mail"></i>&nbsp;0
          </li>
          <li>
            <i class="icon-eye-open" title="views"></i>&nbsp;
            <i class="icon-thumbs-up" title="likes"></i>&nbsp;{{ score }}&nbsp;&nbsp;
            <i class="icon-comments" title="comments"></i>&nbsp;{{ repliesCount }}
          </li>
        </ul>
        {% if post.type == 'book' %}
        <div class="item-meta">
          <img class="img-polaroid" src="//programmazione.it/picture.php?idItem=48456&amp;id=52558c0458cae" alt="cover">
          <span>ISBN: </span>{{ post.isbn }}<br>
          <span>Authors: </span>{{ post.authors }}<br>
          <span>Publisher: </span>{{ post.publisher }}<br>
          <span>Language: </span>{{ post.language }}<br>
          <span>Year: </span>{{ post.year }}<br>
          <span>Pages: </span>{{ post.pages }}<br>
          <span>Attachments: </span>{{ post.attachments is empty ? 'none' : post.attachments }}
          <div class="clear"></div>
        </div>
        {% endif %}
        <section class="item-body">
          {{ post.html }}
          {% if post.type == 'book' %}
          <div class="positive">
            {{ markdown.parse(post.positive) }}
          </div>
          <div class="negative">
            {{ markdown.parse(post.negative) }}
          </div>
          {% endif %}
        </section>
        <div class="ghost gutter">
          <ul class="list item-tags">
            <li><a class="tag {{ post.type }}" href="//{{ domainName~'/'~types[post.type] }}/">{{ types[post.type] }}</a></li>
            {% set tags = post.tags.names() %}
            {% for tag in tags %}
            <li><a class="tag" href="//{{ serverName }}/{{ tag['value'] }}/">{{ tag['value'] }}</a></li>
            {% endfor  %}
          </ul>
          <section class="item-user pull-right">
            <a class="avatar" href="{{ userUrl }}"><img class="img-polaroid" src="{{ post.getGravatar() }}&s=48" /></a>
            <div class="reputation ext">
              <table>
                <tr><td>2345</td></tr>
                <tr><td>REPUTATION</td></tr>
              </table>
            </div>
            <a class="username" href="{{ userUrl }}">{{ post.username }}</a>
          </section>
        </div>
        <ul class="list item-buttons gutter">
          <li><button class="btn btn-like {% if post.votes.exists() %} active{% endif %}" title="like"><i class="icon-thumbs-up icon-largest"></i></button></li>
          <li><button class="btn btn-link score">{{ score }}</button></li>
          <li class="space"></li>
          <li>
            <button class="btn btn-icon blue" title="share permalink to this {{ post.type }}" data-dropdown="#dropdown-share"><i class="icon-share icon-large"></i></button>
            <div id="dropdown-share" class="dropdown dropdown-relative dropdown-tip">
              <ul class="dropdown-menu">
                <li><button><i class="icon-facebook"></i>Share on Facebook</button></li>
                <li><button><i class="icon-twitter"></i>Share on Twitter</button></li>
                <li><button><i class="icon-google-plus"></i>Share on Google+</button></li>
                <li class="dropdown-divider"></li>
                <li><button><i class="icon-mail-forward"></i>Share via e-mail</button></li>
                <li><button><i class="icon-link"></i>Permalink</button></li>
              </ul>
            </div>
          </li>
          <li><button class="btn btn-icon blue" title="flag this {{ post.type }} for serious problem or moderation attention"><i class="icon-flag icon-large"></i></button></li>
          {% if canEdit %}
          <li><a class="btn btn-icon blue" title="revise and improve the {{ post.type }}" href="//{{ serverName~'/'~post.id~'/edit/' }}"><i class="icon-file-text icon-large"></i></a></li>
          {% endif %}
          <li>
            <button id="b-admin" class="btn btn-icon orange" title="admin tools" data-dropdown="#dropdown-moderator"><i class="icon-gear icon-large"></i></button>
            <div id="dropdown-moderator" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
            </div>
          </li>
          <li><button class="btn blue"><i class="icon-reply"></i> REPLY</button></li>
        </ul>

        <ul class="list item-actors">
          {% set membersHaveVoted = post.votes.getVoters() %}
          {% for memberHasVoted in membersHaveVoted %}
          <li><a href="{{ baseUrl~memberHasVoted.id }}"><img class="img-polaroid" title="{{ memberHasVoted.username }}" src="{{ memberHasVoted.gravatar }}&s=20" /></a></li>
          {% endfor  %}
        </ul>
      </section>
    </article>

    <ul class="list tabs">
      <li><span><b>{{ repliesCount }}{% if repliesCount == 1 %} COMMENT{% else %} COMMENTS{% endif %}</b></span></li>
      <li class="pull-right"><a href="#">MOST VOTED</a></li>
      <li class="active pull-right"><a href="#">RECENT</a></li>
    </ul>

    {% for reply in replies %}
    {% set username = reply.username %}
    {% set userUrl = baseUrl~username %}

    {% if not loop.first %}
    {% endif %}

    <hr class="fade-short">
    <div class="item-info">{{ reply.whenHasBeenCreated() }}</div>
    <div class="item-content">
      <div class="item-body">
        {{ reply.html }}
      </div>
      <div class="ghost gutter">
        <section class="item-user pull-right">
          <a class="avatar" href="{{ userUrl }}"><img class="img-polaroid" src="{{ reply.getGravatar() }}&s=48" /></a>
          <div class="reputation ext">
            <table>
              <tr><td>2345</td></tr>
              <tr><td>REPUTATION</td></tr>
            </table>
          </div>
          <a class="username" href="{{ userUrl }}">{{ username }}</a>
        </section>
      </div>
      <ul class="list item-buttons gutter">
        <li><button class="btn btn-like {% if reply.votes.exists() %} active {% endif %} red" title="la risposta mi piace"><i class="icon-thumbs-up icon-largest"></i></button></li>
        <li><button class="btn btn-link score">{{ reply.votes.count() }}</button></li>
        <li><button class="btn btn-accept" title="accetta la risposta"><i class="icon-ok icon-largest"></i></button></li>
        <li class="space"></li>
        <li><button class="btn btn-icon blue" title="share"><i class="icon-link icon-large"></i></button></li>
        <li><button class="btn btn-icon blue"><i class="icon-comment icon-large"></i></button></li>
        <li><button class="btn btn-icon blue" title="segnala un problema riguardante la risposta"><i class="icon-flag icon-large"></i></button></li>
        <li><a class="btn btn-icon blue" title="migliora la risposta modificandone il contenuto" href="//{{ domainName~'/'~post.id~'/edit/' }}"><i class="icon-file-text icon-large"></i></a></li>
        <li><button class="btn btn-icon red" title="elimina la risposta"><i class="icon-trash icon-large"></i></button></li>
      </ul>
    </div>

    {% endfor %}

  </div> <!-- /column-left -->

  <aside class="column-right">
    <div class="banner"><a href="#"><img src="/img/300x250cro.jpeg" /></a></div>
  </aside> <!-- /column-right -->
</div>
{% endblock %}