<section class="notebook" id="updates">
  <ul class="list tabs no-gutter">
    <li class="active"><a href="#articles" data-toggle="tab">ARTICLES</a></li>
    <li><a href="#books" data-toggle="tab">BOOKS</a></li>
  </ul>
  {% if articles is defined %}
  <div class="notebook-page active" id="articles">
    <ul class="items">
      {% for article in articles %}
        <li>
          <a href="{{ article.url }}">
            <div><i class="icon-thumbs-up"></i>&nbsp;{{ article.score }}&nbsp;&nbsp;<i class="icon-comments"></i>&nbsp;{{ article.commentsCount }}</div>
            <div>{{ article.whenHasBeenPublished }}</div>
            {{ article.title }}
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
  {% endif %}
</section>