function alacritty_theme --argument theme
  if ! test -f ~/.config/alacritty/colors.yml
    echo "file ~/.config/alacritty/colors.yml doesn't exist"
    return
  end

  # sed doesn't like symlinks, get the absolute path
  set -l config_path (realpath ~/.config/alacritty/colors.yml)

  sed -i "" -e "s#^colors: \*.*#colors: *$theme#g" $config_path

  echo "switched to $theme."
end
