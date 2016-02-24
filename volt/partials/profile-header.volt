<div class="ghost gutter-plus" style="margin-top: 200px;">
  <div style="position: relative;">
    <img id="avatar" class="img-polaroid pull-left" src="{{ profile.getGravatar(profile.primaryEmail) }}&s=160">
    {% if user.isMember() and user.match(profile.id) %}
      <a class="change-avatar" href="http://it.gravatar.com/"><i class="icon-camera"></i>CAMBIA FOTO</a>
    {% endif %}
  </div>
  <div class="full-name">{% if profile.firstName is defined %}{{ profile.firstName }}{% endif %} {% if profile.lastName is defined %}{{ profile.lastName }}{% endif %}</div>
  <div class="pull-right" style="margin-top: 148px;">
    {% if user.isMember() and (user.match(profile.id) or user.isAdmin()) %}
      <a class="btn blue" href="#"><i class="icon-user"></i> MODIFICA</a>
    {% endif %}
    {% if user.isAdmin() %}
      <a class="btn" href="#"><i class="icon-flag"></i> BANNA</a>
    {% endif %}
  </div>
</div>