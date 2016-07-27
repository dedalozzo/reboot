{% include "partials/navigation/dropdowns/types.volt" %}
<li class="space"></li>
{% include "partials/navigation/dropdowns/dropdown.volt" %}
{{ dropdown('when', 'period', periods, uri, actionRoute) }}