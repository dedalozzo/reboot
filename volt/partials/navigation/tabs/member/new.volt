{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('role', 'role', roles, uri, actionRoute) }}
<li class="space"></li>
{{ dropdown('when', 'period', periods, uri, actionRoute) }}