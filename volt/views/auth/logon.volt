{% extends "templates/base.volt" %}

{% block jsAssets %}
  <script src="https://www.google.com/recaptcha/api.js?onload=CaptchaCallback&render=explicit" async defer></script>
{% endblock %}

{% block topbar %}{% endblock %}
{% block menubar %}{% endblock %}
{% block container %}fixed{% endblock %}
{% block billboard %}{% endblock %}

{% block header %}
  <ul class="list auto">
    {% include "partials/brand.volt" %}
  </ul>
{% endblock %}

{% block content %}
  <div id="content" class="no-top">

    <div id="page-title">{{ title }}</div>
    <hr class="fade-long">

    {{ flash.output() }}

    <div class="welcome">
      <img src="{{ dist }}/img/languages.jpg" width="530" height="261">
      <p>
        Stai connesso con amici, colleghi, altri geeks come te, con la medesima passione per l'informatica.
        Tieniti aggiornato sulle cose che ti interessano. Apprendi dagli altri e insegna loro ciò che già sai.
        È del tutto <b>gratuito</b> e lo sarà sempre!
      </p>
    </div>

    <aside class="registration">
      <section class="notebook gutter" id="sign">
        <ul class="list tabs no-gutter">
          <li{% if signin is defined or logon is defined%} class="active"{% endif %}><a href="#signin" data-toggle="tab">Sign In</a></li>
          <li{% if signup is defined %} class="active"{% endif %}><a href="#signup" data-toggle="tab">Sign Up</a></li>
        </ul>
        <div class="notebook-page{% if signin is defined or logon is defined %} active{% endif %}" id="signin">
          <div>
            <p>Se possiedi già un'utenza sul sito, puoi accedere usando le tue credenziali.</p>
            <form action="//{{ serverName }}/logon/" id="signinform" name="signinform" method="post" role="form">
              <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
              <div class="half-gutter">
                {{ email_field("email", "placeholder": "E-mail") }}
                {% if signin is defined %}<span class="error">{{ validation.first("email") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                {{ password_field("password", "placeholder": "Password") }}
                {% if signin is defined %}<span class="error">{{ validation.first("password") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                <div class="g-recaptcha" data-sitekey=""></div>
                <span class="error">{{ validation.first("captcha") }}</span>
              </div>
              <div class="align-right">
                <button type="submit" name="signin" class="btn blue">Sign In</button>
              </div>
            </form>
          </div>
          <div>
            <p>Se non sei ancora registrato, puoi accedere usando uno dei seguenti social networks.</p>
            <ul class="list social half-gutter">
              <li><a id="facebook-btn" rel="facebook" href="//{{ serverName }}/logon/facebook/"><span class="logo"></span>Facebook</a></li>
              <li><a id="google-btn" rel="google" href="//{{ serverName }}/logon/google/"><span class="logo"></span>Google+</a></li>
              <li class="space"></li>
            </ul>
            <ul class="list social">
              <li><a id="linkedin-btn" rel="linkedin" href="//{{ serverName }}/logon/linkedin/"><span class="logo"></span>LinkedIn</a></li>
              <li><a id="github-btn" rel="github" href="//{{ serverName }}/logon/github/"><span class="logo"></span>GitHub</a></li>
              <li class="space"></li>
            </ul>
          </div>
        </div>
        <div class="notebook-page{% if signup is defined %} active{% endif %}" id="signup">
          <div>
            <form action="//{{ serverName }}/logon/" id="signupform" name="signupform" method="post" role="form">
              <div class="half-gutter">
                {{ text_field("username", "placeholder": "Nome utente") }}
                {% if signup is defined %}<span class="error">{{ validation.first("username") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                {{ email_field("email", "placeholder": "E-mail") }}
                {% if signup is defined %}<span class="error">{{ validation.first("email") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                {{ password_field("password", "placeholder": "Password") }}
                {% if signup is defined %}<span class="error">{{ validation.first("password") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                {{ password_field("confirmPassword", "placeholder": "Ripeti la password") }}
                {% if signup is defined %}<span class="error">{{ validation.first("confirmPassword") }}</span>{% endif %}
              </div>
              <div class="half-gutter">
                <div class="g-recaptcha" data-sitekey=""></div>
                <span class="error">{{ validation.first("captcha") }}</span>
              </div>
              <div class="align-right">
                <button type="submit" name="signup" value="signup" class="btn blue">Sign Up</button>
              </div>
            </form>
          </div>
          <div>
            <p>Puoi anche registrarti usando uno dei seguenti social networks.</p>
            <ul class="list social half-gutter">
              <li><a id="facebook-btn" rel="facebook" href="//{{ serverName }}/logon/facebook/"><span class="logo"></span>Facebook</a></li>
              <li><a id="google-btn" rel="google" href="//{{ serverName }}/logon/google/"><span class="logo"></span>Google+</a></li>
              <li class="space"></li>
            </ul>
            <ul class="list social">
              <li><a id="linkedin-btn" rel="linkedin" href="//{{ serverName }}/logon/linkedin/"><span class="logo"></span>LinkedIn</a></li>
              <li><a id="github-btn" rel="github" href="//{{ serverName }}/logon/github/"><span class="logo"></span>GitHub</a></li>
              <li class="space"></li>
            </ul>
          </div>
        </div>
      </section>
    </aside>

  </div> <!-- /content -->
{% endblock %}

{% block script %}
  <script type="text/javascript">
    $('.g-recaptcha').each(function(index, el) {
      grecaptcha.render(el, {'sitekey' : '{{ recaptchaKey }}'});
    });
  </script>
{% endblock %}