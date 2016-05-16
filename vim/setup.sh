# run to enable configuration

git config --global push.default simple
git config --global core.editor "vim"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Running $SCRIPT_DIR"
cd ~
for file in $(ls -a "$SCRIPT_DIR")
do
  if [ "$file" = "$(basename $0)" ]
  then
    continue
  fi

  if [ -f "$SCRIPT_DIR/$file" ]
  then
    echo $file
    ln -fs $SCRIPT_DIR/$file ./$file
  fi
done

mkdir -p .vim
mkdir -p .vim/backup
mkdir -p .vim/swap

for file in $(ls -a "$SCRIPT_DIR/.vim")
do
  if [ "$file" = "." -o "$file" = ".." ]
  then
    continue
  fi
  echo $file
  ln -fsn $SCRIPT_DIR/.vim/$file ./.vim/$file
done

