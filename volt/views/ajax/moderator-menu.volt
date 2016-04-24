<ul class="dropdown-menu">
  {% if canProtect %}
    {% set showDiv = TRUE %}
    <li><button id='m-close' title="prevent members from adding further {% if post.type == 'question' %} answers{% else %} comments{% endif %} to the {{ post.type }}"><i class="icon-lock"></i>Close</button></li>
    <li><button id='m-lock' title="protect the {{ post.type }} from further modifications"><i class="icon-umbrella"></i>Lock</button></li>
  {% elseif canUnprotect %}
    {% set showDiv = TRUE %}
    <li><button id='m-unprotect' title="unprotect the {{ post.type }}"><i class="icon-sun"></i>Unprotect</button></li>
  {% endif %}
  {% if canChangeVisibility %}
    {% if showDiv is TRUE %}
      <li class="dropdown-divider"></li>
    {% endif %}
    {% set showDiv = TRUE %}
    {% if post.isVisible() %}
      <li><button id="m-hide" title="hide the {{ post.type }}"><i class="icon-eye-close"></i>Hide</button></li>
    {% else %}
      <li><button id="m-show" title="show the {{ post.type }}"><i class="icon-eye-open"></i>Show</button></li>
    {% endif %}
  {% endif %}
  {% if canMoveToTrash %}
    {% if showDiv is TRUE %}
      <li class="dropdown-divider"></li>
    {% endif %}
    <li><button id="m-trash" title="move the {{ post.type }} to the trash"><i class="icon-trash"></i>Move to trash</button></li>
  {% elseif canRestore %}
    {% if showDiv is TRUE %}
      <li class="dropdown-divider"></li>
    {% endif %}
    <li><button id="m-undo" title="restore the {{ post.type }} from the trash"><i class="icon-undo"></i>Put back</button></li>
  {% endif %}
</ul>