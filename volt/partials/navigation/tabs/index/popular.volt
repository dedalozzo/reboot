{% include "partials/navigation/dropdowns/tags.volt" %}
{% include "partials/navigation/dropdowns/types.volt" %}
<li class="space"></li>
{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('periods', filters, uri, actionRoute) }}