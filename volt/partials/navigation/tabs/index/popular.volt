{% include "partials/navigation/dropdowns/types.volt" %}
<li class="space"></li>
{% include "partials/navigation/dropdowns/filters.volt" %}
{{ dropdown('when', 'period', periods, uri, actionRoute) }}