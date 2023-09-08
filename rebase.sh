#/bin/sh 

ra="sed -i 's/>>>>>>>.*//g'"
la="sed -i 's/<<<<<<<.*//g'"
eq="sed -i 's/=======.*//g'"

read -p "Paste the file location: " path

if [ -f "$path" ]; then
  eval "$eq $path"
  eval "$la $path"
  eval "$ra $path"
  git add $path
else
  echo "File not found."
  exit 1
fi

echo "Completed process, check the file if you're not sure"
read -p "Do you want to open the file [y/n]: " file
case "$file" in
  y | Y | yes | Yes | YES)
    nvim "$path"
    ;;
  *)
    echo "File not opened." ;;
esac

