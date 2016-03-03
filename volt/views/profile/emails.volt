{% extends "templates/base.volt" %}

{% block topbar %}
  {% include "partials/navigation/topbar.volt" %}
{% endblock %}

{% block content %}
<div id="content" class="profile-top" style="background-image: url(//assets.worldwildlife.org/photos/1028/images/story_full_width/western-lowland-gorilla-heroHI_279168.jpg?1345535856); background-size: 1010px 410px; background-repeat: no-repeat;">
  {% include "partials/profile-header.volt" %}

  {% set controllerPath = '/' %}
  {% include "partials/navigation/tabs/profile/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  {{ flash.output() }}

  <div class="column-left compressed">

    {% include "partials/navigation/settings.volt" %}

  </div> <!-- /column-left -->

  <div class="column-right expanded">
    <div class="ghost gutter">
      <form action="//{{ serverName }}/logon/" id="passwordform" name="passwordform" method="post" role="form">
        <fieldset>
          <table id="emails" class="gutter">
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
                <td>Verification e-mail sent. <a href="#">Resend</a></td>
                {% elseif not primary %}
                <td><a href="#">Make e-mail primary</a>.</td>
                {% else %}
                <td></td>
                {% endif %}
                <td>{{ verified ? '' : 'Verification e-mail sent. <a href="#">Resend</a>.' }}</td>
                <td>{{ primary ? '<div class="highlight blue">primary</div>' : '' }}</td>
                <td>{{ verified ? '<div class="highlight green">verified</div>' : '<div class="highlight red">not verified</div>' }}</td>
                <td>{{ user.canRemoveEmail(email) ? '' : '<button class="btn btn-icon red" title="remove e-mail"><i class="icon-trash icon-large"></i></button>' }}</td>
              </tr>
            {% endfor %}
            {% for email, verified in emails %}
              <tr>
                <td width="100%">dedalo@doramail.com</td>
                <td>Verification e-mail sent. <a href="#">Resend</a>.</td>
                <td></td>
                <td><div class="highlight red">not verified</div></td>
                <td><button class="btn btn-icon red" title="remove e-mail"><i class="icon-trash icon-large"></i></button></td>
              </tr>
              <tr>
                <td width="100%">francesco.bianchi@yandex.com</td>
                <td><a href="#">Make e-mail primary</a>.</td>
                <td></td>
                <td><div class="highlight green">verified</div></td>
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