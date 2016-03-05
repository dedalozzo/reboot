{% include "partials/navigation/dropdowns/tags.volt" %}
<li class="space"></li>
{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('bounties', filters, uri, actionRoute) }}