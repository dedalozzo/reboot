{% include "partials/navigation/dropdowns/dropdown.volt" %}
{{ dropdown('role', 'role', roles, uri, actionRoute, null, [dispatcher.getParam('period')]) }}
<li class="space"></li>
{{ dropdown('when', 'period', periods, uri, actionRoute, [dispatcher.getParam('role')]) }}