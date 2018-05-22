{% extends "templates/base.volt" %}

{% block jsAssets %}
  <script src="https://www.google.com/recaptcha/api.js?onload=captchaCallback&render=explicit" async defer></script>
{% endblock %}

{% block menubar %}{% endblock %}
{% block container %}fixed{% endblock %}
{% block billboard %}{% endblock %}

{% block content %}
  <div id="content">

    <div id="page-title">{{ title }}</div>
    <hr class="fade-long">

    {{ flash.output() }}

    <div class="welcome">
      <img src="{{ dist }}/img/languages.jpg" width="530" height="261">
      <p>
        Host your blog with us, write your articles offline using an extended version of Markdown, push them on your Git
        repo, and relax! We'll work our magic for you...
        Would you like to use your own domain? Use our APIs to serve the contents.
        Stay connected with friends, colleagues, other geeks like you, with the same passion for information technology.
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
            <p>If you already have an account, use the same log in credentials.</p>
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
                <span class="error">{{ validation.first("captchaSignIn") }}</span>
              </div>
              <div class="align-right">
                <button type="submit" name="signin" class="btn blue">SIGN IN</button>
              </div>
            </form>
          </div>
          <div>
            <p>If you are not yet registered, you can log in using one of the following social networks.</p>
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
                <span class="error">{{ validation.first("captchaSignUp") }}</span>
              </div>
              <div class="align-right">
                <button type="submit" name="signup" value="signup" class="btn blue">SIGN UP</button>
              </div>
            </form>
          </div>
          <div>
            <p>You can log in using one of the following social networks.</p>
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

{% block footer %}
  {% include "partials/navigation/footer.volt" %}
{% endblock %}

{% block script %}
  <script type="text/javascript">
    var captchaCallback = function() {
      $('.g-recaptcha').each(function(index, el) {
        grecaptcha.render(el, {'sitekey' : '{{ recaptchaKey }}'});
      });
    };
  </script>
{% endblock %}