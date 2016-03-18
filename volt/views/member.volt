{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
  {% include "partials/navigation/tabs/member/" %}
  {% include "partials/navigation/tabs.volt" %}
  {% include "partials/navigation/dropdowns.volt" %}

  {% if members is defined %}
    {% for member in members %}
      {% set modulus = loop.index % 2 %}
      {% set url = '//'~domainName~'/'~member.username %}
      {% if loop.first %}
      <ul class="list gutter">
      {% endif %}
        <li style="width: 50%;">
          <section class="item-user">
            <a class="avatar" href="{{ url }}"><img class="img-polaroid" src="{{ member.gravatar }}&s=100" /></a>
            <div class="reputation ext">
              <table>
                <tr><td>2345</td></tr>
                <tr><td>REPUTAZIONE</td></tr>
              </table>
            </div>
            <a class="username" href="{{ url }}">{{ member.username }}</a>
          </section>
        </li>
      {% if loop.last %}
        {% for i in 1..modulus  %}
        <li style="width: 25%;"></li>
        {% endfor  %}
      </ul>

      <hr>
      {% elseif (modulus == 0) %}
      </ul>

      <hr>

      <ul class="list gutter">
      {% endif %}
      {% elsefor %}
      <div class="alert alert-info">Siamo spiacenti, la ricerca non ha prodotto alcun risultato.</div>
    {% endfor %}
    {% include "partials/pagination.volt" %}
  {% endif %}
  </div>
{% endblock %}