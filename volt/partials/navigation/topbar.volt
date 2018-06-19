{# Top Bar #}
<nav class="topbar">
  <ul class="list">
    <li><a class="logo" href="/" target="_self"><img src="{{ dist }}/img/brand.png" width="29" height="30"></a></li>
    <li>
      <form class="topbar-search" method="get" action="search.php" autocomplete="off" name="form_search">
        <input class="" type="search" placeholder="Search" autocomplete="on" id="keyword" name="keyword">
        <i class="icon-search"></i>
      </form>
    </li>
    <li><a class="link" href="//{{ domainName }}/blogs/">Blogs</a></li>
    <li><a class="link" href="//{{ domainName }}/articles/">Articles</a></li>
    <li><a class="link" href="//{{ domainName }}/tags/"><i class="icon-tags"></i>&nbsp;Tags</a></li>
    <li><a class="link" href="//{{ domainName }}/users/"><i class="icon-group"></i>&nbsp;Users</a></li>
    <li class="space"></li>
    {% if user.isMember() %}
      {% set userUri = '//'~domainName~'/users/'~user.username %}
    <li>
      <button class="btn btn-icon blue" data-dropdown="#dropdown-user"><img class="gravatar" src="{{ user.getGravatar(user.emails.getPrimary()) }}&s=20"></button>
      <div id="dropdown-user" class="dropdown dropdown-relative dropdown-anchor-right dropdown-tip">
        <ul class="dropdown-menu">
          <li><span>Signed in as<br><b>{{ user.username }}</b></span></li>
          <li class="dropdown-divider"></li>
          <li><a href="{{ userUri }}"><i class="icon-home"></i>Timeline</a></li>
          <li class="dropdown-divider"></li>
          <li><a href="{{ userUri }}/about/"><i class="icon-user"></i>Profile</a></li>
          <li><a href="{{ userUri }}/connections/"><i class="icon-group"></i>Connections</a></li>
          <li><a href="{{ userUri }}/repositories/"><i class="icon-github"></i>Repositories</a></li>
          <li class="dropdown-divider"></li>
          <li><a href="{{ userUri }}/settings/"><i class="icon-wrench"></i>Settings</a></li>
          <li><button><i class="icon-gears"></i>Administration</button></li>
          <li class="dropdown-divider"></li>
          <li><a href="//{{ domainName }}/signout/"><i class="icon-signout"></i>Sign Out</a></li>
        </ul>
      </div>
    </li>
    <li><button class="btn btn-icon blue" title="messages and notifications" data-dropdown="#dropdown-inbox"><i class="icon-inbox icon-large"></i></button></li>
    {% else %}
    <li><a class="link" href="//{{ domainName }}/logon/"><i class="icon-signin"></i> Log In</a></li>
    {% endif %}
  </ul>

  <!-- <a href="#" data-toggle="modal" data-target="#myModal">Registrati</a> -->
  <!-- Button trigger modal -->
</nav>