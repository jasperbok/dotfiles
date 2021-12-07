function fish_prompt
  if set -q VIRTUAL_ENV
    set_color blue
    echo -n -s "(" (basename "$VIRTUAL_ENV") ") "
  end

  set_color yellow
  echo -n -s (basename $PWD) '> '
  set_color normal
end

set PATH "~/bin" "$PATH"

set -x EDITOR nvim
