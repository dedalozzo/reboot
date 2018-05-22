{% extends "templates/base.volt" %}

{% block topbar %}{% endblock %}
{% block menubar %}{% endblock %}
{% block container %}fixed{% endblock %}

{% block header %}
  <ul class="list auto">
    {% include "partials/brand.volt" %}
  </ul>
{% endblock %}

{% block content %}
  <div id="content" class="no-top">

    <div id="page-title">{{ title }}</div>
    <hr class="fade-long">

    <div class="welcome">
      <div class="wrap">
        <img src="{{ dist }}/img/languages.jpg" width="530" height="261">
        <div class="error"><span>{{ code }}</span></div>
      </div>
      <p>
        {{ message }}
      </p>
    </div>

    {% if user.isMember() %}
      {% set username = user.username %}
    {% else %}
      {% set username = 'guest' %}
    {% endif %}

    <aside class="prompt gutter">
      <p>
        <span class="at">{{ username }}@pit</span>:<span class="tilde">~</span>$&nbsp;wget&nbsp;{{ url }}<br>
        --{{ date('Y-m-d H:i:s', time()) }}--  {{ url }}<br>
        Resolving {{ domainName }}...<br>
        Connecting to {{ domainName }}|{{ serverAddr }}|:{{ serverPort }}... connected.<br>
        HTTP request sent, awaiting response...&nbsp;{{ code }}&nbsp;{{ title }}<br>
        {{ date('Y-m-d H:i:s', time()) }}&nbsp;ERROR {{ code }}:&nbsp;{{ title }}.<br>
        <span class="at">{{ username }}@pit</span>:<span class="tilde">~</span>$&nbsp;<blink>&#95</blink>
      </p>
    </aside>

  </div> <!-- /content -->
{% endblock %}

{% block footer %}
  {% include "partials/navigation/footer.volt" %}
{% endblock %}