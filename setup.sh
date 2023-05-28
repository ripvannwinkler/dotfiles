#files=$(find "$PWD/config" -type f)

for d in config config/linux; do

    for f in $(find "$PWD/$d" -maxdepth 1 -type f); do
        dest=~/$(basename $f)
        echo Linking $dest to $f
        [ -f $dest ] && unlink $dest
        ln -s $f $dest
    done

done
