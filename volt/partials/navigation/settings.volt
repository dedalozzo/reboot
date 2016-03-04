{# Settings #}
{% set uri = '//'~domainName~'/'~controllerRoute %}
<ul class="list vertical pills half-gutter">
  <li{{ ('settings' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/">Personal Info</a></li>
  <li{{ ('username' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/username/">Change Username</a></li>
  <li{{ ('password' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/password/">Change Password</a></li>
  <li{{ ('logins' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/logins/">Logins</a></li>
  <li{{ ('emails' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/emails/">Emails</a></li>
  <li{{ ('privacy' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/privacy/">Privacy</a></li>
</ul>