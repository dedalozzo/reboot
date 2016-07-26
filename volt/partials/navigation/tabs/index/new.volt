{% if etag is defined %}
<li><span><a id="{{ etag.id }}" class="btn-star{% if user.tags.exists(etag.unversionId) %} active{% endif %}" title="add to favorites"><i class="icon-star icon-large"></i></a>&nbsp;<b>{{ etag.name }}</b></span></li>
{% endif %}
{% include "partials/navigation/dropdowns/types.volt" %}
<li class="space"></li>