{% set tabs = [
'index': 'timeline',
'about': 'about',
'connections': 'connections',
'repositories': 'repositories',
'settings': ['settings']
] %}
{% set controllerRoute = 'users/'~profile.username~'/' %}