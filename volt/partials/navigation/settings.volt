{# Settings #}
{% set uri = '//'~domainName~'/'~controllerRoute %}
<ul class="list vertical rabs half-gutter">
  <li{{ ('settings' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/">General Settings</a></li>
  <li{{ ('account' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/account/">Account Settings</a></li>
  <li{{ ('logins' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/logins/">Logins</a></li>
  <li{{ ('emails' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/emails/">Emails</a></li>
  <li{{ ('privacy' === actionName) ? ' class="active"' : '' }}><a href="{{ uri }}settings/emails/">Privacy Settings</a></li>
</ul>