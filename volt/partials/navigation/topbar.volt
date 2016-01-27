{# Top Bar #}
<nav class="topbar">
  <ul class="list">
    {% include "partials/brand.volt" %}
    <li>
      <form class="topbar-search" method="get" action="search.php" autocomplete="off" name="form_search">
        <input class="" type="search" placeholder="Search" autocomplete="on" id="keyword" name="keyword">
        <i class="icon-search"></i>
      </form>
    </li>
    <li><a class="link" href="//{{ domainName }}/tour/">Tour</a></li>
    <li><a class="link" href="//{{ domainName }}/aiuto/">Help</a></li>
    <li><a class="link" href="//{{ domainName }}/tags/"><i class="icon-tags"></i>&nbsp;Tags</a></li>
    <li><a class="link" href="//{{ domainName }}/users/"><i class="icon-group"></i>&nbsp;Users</a></li>
    <li class="space"></li>
    {% if user.isMember() %}
      {% set userUri = '//'~domainName~'/'~user.username %}
    <li>
      <button class="btn btn-icon blue" data-dropdown="#dropdown-user"><img class="gravatar" src="{{ user.getGravatar(user.primaryEmail) }}&s=20"> {{ user.username }}</button>
      <div id="dropdown-user" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
        <ul class="dropdown-menu">
          <li><a href="{{ userUri }}"><i class="icon-home"></i>Timeline</a></li>
          <li class="dropdown-divider"></li>
          <li><a href="{{ userUri }}/about/"><i class="icon-user"></i>Profile</a></li>
          <li><a href="{{ userUri }}/connections/"><i class="icon-group"></i>Connections</a></li>
          <li><a href="//{{ domainName }}/favorites/"><i class="icon-star"></i>Favorites</a></li>
          <li><a href="{{ userUri }}/projects/"><i class="icon-github"></i>Projects</a></li>
          <li class="dropdown-divider"></li>
          <li><a href="{{ userUri }}/settings/"><i class="icon-wrench"></i>Settings</a></li>
          <li><button><i class="icon-gears"></i>Administration</button></li>
          <li class="dropdown-divider"></li>
          <li><a href="//{{ domainName }}/signout/"><i class="icon-signout"></i>Sign Out</a></li>
        </ul>
      </div>
    </li>
    <li><button class="btn btn-icon blue" title="messaggi e notifiche" data-dropdown="#dropdown-inbox"><i class="icon-inbox icon-large"></i></button></li>
    {% endif %}
  </ul>

  <!-- <a href="#" data-toggle="modal" data-target="#myModal">Registrati</a> -->
  <!-- Button trigger modal -->
</nav>