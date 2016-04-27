{# Settings #}
{% set uri = '//'~domainName~'/settings' %}
<ul class="list vertical pills half-gutter">
  <li{{ ('settings' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/">Personal Info</a></li>
  <li{{ ('username' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/username/">Change Username</a></li>
  <li{{ ('password' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/password/">Change Password</a></li>
  <li{{ ('logins' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/logins/">Social Logins</a></li>
  <li{{ ('emails' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/emails/">Emails</a></li>
  <li{{ ('privacy' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/privacy/">Privacy Settings</a></li>
  <li{{ ('blacklist' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}/blacklist/">Blacklist</a></li>
</ul>