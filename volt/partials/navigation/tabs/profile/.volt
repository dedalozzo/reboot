{% set tabs = [
'index': 'timeline',
'about': 'about',
'connections': 'connections',
'projects': 'projects',
'settings': ['settings'] {# settings will be shown only if the the current user matches the profile #}
] %}
{% set controllerRoute = profile.username~'/' %}