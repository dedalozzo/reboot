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

    <div class="gutter">
      <form action="//{{ serverName }}/logon/" id="passwordform" name="passwordform" method="post" role="form">
        <fieldset>
          <div class="gutter">Your <b>primary e-mail address</b> will be used to send you notifications as well as any kind of communication. You may change your primary e-mail anytime, choosing between any verified e-mails. The primary e-mail address can't be removed.</div>
          <table id="emails" class="std gutter">
            <tbody>
            {% set logins = user.getLogins() %}
            {% for address, login in logins %}
              <tr>
                <td width="100%">{{ login[2] }}</td>
                <td>{{ login[0] }}</td>
                <td><a href="{{ login[3] }}">{{ login[1] }}</a></td>
                <td><button class="btn btn-icon red" title="remove e-mail"><i class="icon-trash icon-large"></i></button></td>
              </tr>
            {% endfor %}
            </tbody>
          </table>
          <div class="half-gutter">
            <label for="email">Add e-mail address:</label><br>
            {{ email_field("email", "placeholder": "E-mail address", 'class': 'half') }}<button type="submit" name="addEmail" value="addEmail" class="btn blue">Save</button>
            {% if addEmail is defined %}<span class="error">{{ validation.first("password") }}</span>{% endif %}
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