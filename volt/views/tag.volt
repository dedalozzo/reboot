{% extends "templates/base.volt" %}

{% block content %}
  <div id="content">
    <div class="banner"><a href="#"><img src="/img/970x180.jpg" /></a></div>

    {% include "partials/navigation/tabs/tag/" %}
    {% include "partials/navigation/tabs.volt" %}
    {% include "partials/navigation/filters.volt" %}

    <div class="ghost gutter">Un tag è un'etichetta che relaziona un contenuto con altri simili, inerenti lo stesso argomento. Un corretto utilizzo dei tag permette agli utenti di trovare contenuti afferenti ai propri interessi, agevolandoli nella selezione delle domande a cui potrebbero essere in grado di rispondere.</div>

    {% include "partials/list-of-tags.volt" %}

  </div>
{% endblock %}