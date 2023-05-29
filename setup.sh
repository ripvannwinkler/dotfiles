OPTIND=1
overwrite=0
base_dir=$(dirname $0)

link_files() {

    for f in $(find "$1" -maxdepth 1 -type f); do
        src=$(readlink -f $f)
        dest=~/$(basename $f)
        do_link=1;

        if [ -f "$dest" ]; then
            if [ $overwrite -eq 1 ]; then
                rm -f "$dest"
            else
                do_link=0
                echo "File $dest exists; use -f to overwrite"
            fi
        fi

        if [ $do_link -eq 1 ]; then
            ln -s "$src" "$dest"
            echo "Linked $dest to $src"
        fi
    done

}

# loop through opts
while getopts "f" opt; do
    case "$opt" in
    f) 
        overwrite=1
        echo "Overwriting existing files"
        ;;
    esac
done

# shift opts out
shift $((OPTIND - 1))
[ "${1:-}" = "--" ] && shift

link_files "$base_dir/config"
exec $SHELL
