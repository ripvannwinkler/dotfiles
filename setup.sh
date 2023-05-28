relink(){

    for f in $(find "$1" -maxdepth 1 -type f); do
        dest=~/$(basename $f)
        echo Linking $dest to $f
        [ -f $dest ] && unlink $dest
        ln -s $f $dest
    done

}

relink "$(dirname $0)/config"
relink "$(dirname $0)/config/linux"
