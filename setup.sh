files=$(find "$PWD/config" -type f)

for f in $files; do 
	dest=~/$(basename $f)
    echo Linking $dest to $f
	[ -f $dest ] && unlink $dest
	ln -s $f $dest
done
