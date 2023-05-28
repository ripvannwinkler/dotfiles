relink() {

    for f in $(find "$1" -maxdepth 1 -type f); do
        src=$(readlink -f $f)
        dest=~/$(basename $f)
        echo Linking $dest to $src
        rm -f "$dest"
        ln -s "$src" "$dest"
    done

}

relink "$(dirname $0)/config"
exec $SHELL
