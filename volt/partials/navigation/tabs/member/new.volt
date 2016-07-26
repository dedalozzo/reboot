{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('role', filters, uri, actionRoute) }}
<li class="space"></li>
{{ dropdown('when', periods, uri, actionRoute) }}