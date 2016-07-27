{% include "partials/navigation/dropdowns/dropdown.volt" %}
{{ dropdown('role', 'role', roles, uri, actionRoute) }}
<li class="space"></li>
{{ dropdown('when', 'period', periods, uri, actionRoute, [dispatcher.getParam('role')]) }}