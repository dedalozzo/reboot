{% extends "templates/base.volt" %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}

  {{ flash.output() }}

  <div class="column-left super">

    {% include "partials/navigation/filters.volt" %}
    {% include "partials/list-of-members.volt" %}

  </div> <!-- /column-left -->

  <aside class="column-right wide-skyscraper">
    <div class="banner"><a href="#"><img src="http://city916.com/Images/160x600.gif" width="160" height="600" /></a></div>
  </aside> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}