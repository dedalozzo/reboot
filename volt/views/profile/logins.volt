{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set controllerPath = '/' %}
  {% set tabName = 'settings' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  {{ flash.output() }}

  <div class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right expanded">

    {% macro format_consumer_name(consumerName) %}
      {% if consumerName == "facebook" %}
        Facebook
      {% elseif consumerName == "linkedin" %}
        LinkedIn
      {% elseif consumerName == "github" %}
        GitHub
      {% elseif consumerName == "google" %}
        Google
      {% endif %}
    {% endmacro %}

    <div class="gutter">
      <form action="//{{ serverName }}/logon/" id="passwordform" name="passwordform" method="post" role="form">
        <fieldset>
          <div class="gutter">Your <b>primary e-mail address</b> will be used to send you notifications as well as any kind of communication. You may change your primary e-mail anytime, choosing between any verified e-mails. The primary e-mail address can't be removed.</div>
          <table id="logins" class="std gutter">
            <tbody>
            {% set logins = user.getLogins() %}
            {% for address, login in logins %}
              <tr>
                <td><div class="highlight {{ login[0] }}">{{ format_consumer_name(login[0]) }}</div></td>
                <td width="100%">{{ login[2] }}</td>
                <td><a href="{{ login[3] }}">{{ login[1] }}</a></td>
                <td><button class="btn btn-icon red" title="remove e-mail"><i class="icon-trash icon-large"></i></button></td>
              </tr>
            {% endfor %}
            </tbody>
          </table>
          <div>
            <p>Puoi anche registrarti usando uno dei seguenti social networks.</p>
            <ul class="list social half-gutter">
              <li><a id="facebook-btn" rel="facebook" href="//{{ serverName }}/logon/facebook/"><span class="logo"></span>Facebook</a></li>
              <li><a id="google-btn" rel="google" href="//{{ serverName }}/logon/google/"><span class="logo"></span>Google+</a></li>
              <li><a id="linkedin-btn" rel="linkedin" href="//{{ serverName }}/logon/linkedin/"><span class="logo"></span>LinkedIn</a></li>
              <li><a id="github-btn" rel="github" href="//{{ serverName }}/logon/github/"><span class="logo"></span>GitHub</a></li>
              <li class="space"></li>
            </ul>
          </div>
        </fieldset>
      </form>
    </div>

  </div> <!-- /column-right -->

</div> <!-- /content -->
{% endblock %}

{% block script %}
<script>
  $('html, body').animate({scrollTop: '+=200px'}, 1);
</script>
{% endblock %}