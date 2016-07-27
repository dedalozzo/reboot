{% include "partials/navigation/dropdowns/dropdown.volt" %}
<li class="space"></li>
{{ dropdown('role', 'role', roles, uri, actionRoute, null, [dispatcher.getParam('period')]) }}
{{ dropdown('when', 'period', periods, uri, actionRoute, [dispatcher.getParam('role')]) }}