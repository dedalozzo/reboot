{% include "partials/navigation/dropdowns/tags.volt" %}
{% include "partials/navigation/dropdowns/types.volt" %}
<li class="space"></li>
{% include "partials/navigation/dropdowns/periods.volt" %}
{{ dropdown('periods', filters, uri, actionRoute) }}