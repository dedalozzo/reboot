{% extends "templates/base.volt" %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set tabName = 'settings' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}

  <aside class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </aside> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="ghost gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/username/" id="usernamefrm" name="usernamefrm" method="post" role="form">
        <fieldset>
          <p class="gutter">The <b>username</b> uniquely identifies yourself on the website. You are allowed to change your username anytime, but this will effect your ranking on search engines.</p>
          <ul class="list vertical post-it">
            <li class="title">A username should match the following conditions</li>
            <li><i class="icon-caret-right small"></i> only one special char between <span class="keyword">.</span>, <span class="keyword">_</span>, <span class="keyword">-</span> is allowed and it must not be at the extremes of the string</li>
            <li><i class="icon-caret-right small"></i> the first character cannot be a number</li>
            <li><i class="icon-caret-right small"></i> all the other characters allowed are letters and numbers</li>
            <li><i class="icon-caret-right small"></i> the total length should be between <span class="keyword">{{ usernameMinLength }}</span> and <span class="keyword">{{ usernameMaxLength }}</span> chars</li>
            <li><i class="icon-caret-right small"></i> the username is case sensitive, that means <span class="keyword">foobar</span> is different from <span class="keyword">FooBar</span></li>
          </ul>
          <div class="gutter">
            <label for="username">Username:</label><br>
            {{ text_field("username", "placeholder": "Nome utente", 'class': 'half') }}
            <span class="error">{{ validation.first("username") }}</span>
          </div>
          <button type="submit" name="update" value="update" class="btn red">CHANGE USERNAME</button>
        </fieldset>
      </form>
    </div>

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block footer %}
  {% include "partials/navigation/footer.volt" %}
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}