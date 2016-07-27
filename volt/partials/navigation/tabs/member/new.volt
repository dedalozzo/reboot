{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('role', roles, uri, actionRoute) }}
<li class="space"></li>
{{ dropdown('when', periods, uri, actionRoute) }}