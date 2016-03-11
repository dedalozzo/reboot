{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set tabName = 'settings' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  <div class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right expanded">

    {{ flash.output() }}

    <div class="gutter">
      <form action="//{{ serverName }}/{{ user.username }}/settings/emails/" id="emailsfrm" name="emailsfrm" method="post" role="form">
        <fieldset>
          <p class="gutter">Your <b>primary e-mail address</b> will be used to send you notifications as well as any kind of communication. You may change your primary e-mail anytime, choosing between any verified e-mails. The primary e-mail address can't be removed.</p>
          <table id="emails" class="std gutter">
            <tbody>
            {% set emails = user.getEmails() %}
            {% for email, verified in emails %}
              <tr>
                {%  if (user.primaryEmail === email) %}
                  {% set primary = TRUE %}
                {% else %}
                  {% set primary = FALSE %}
                {% endif %}
                <td width="100%">{{ primary ? '<b>'~email~'</b>' : email }}</td>
                {% if not verified %}
                <td><a href="#">Resend verification e-mail</a>.</td>
                {% elseif not primary %}
                <td><a href="#">Set as primary e-mail</a>.</td>
                {% else %}
                <td></td>
                {% endif %}
                <td>{{ primary ? '<div class="highlight blue">primary</div>' : '' }}</td>
                <td>{{ verified ? '<div class="highlight green">verified</div>' : '<div class="highlight orange">not verified</div>' }}</td>
                <td>{{ user.canRemoveEmail(email) ? '<button class="btn btn-icon red" title="remove e-mail"><i class="icon-trash icon-large"></i></button>' : '' }}</td>
              </tr>
            {% endfor %}
            </tbody>
          </table>
          <div class="gutter">
            <label for="email">Add an e-mail address:</label><br>
            {{ email_field("email", "placeholder": "foo.bar@example.com", 'class': 'half') }}
            <span class="error">{{ validation.first("email") }}</span>
          </div>
          <button type="submit" name="addEmail" value="addEmail" class="btn blue">ADD E-MAIL ADDRESS</button>
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