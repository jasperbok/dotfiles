# dj is a shortcut function for interacting with Django projects.
#
# Examples:
#
#   dj runserver
#   dj migrate
function dj
    python manage.py $argv
end
