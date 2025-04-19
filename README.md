
eval "$(starship init bash)"

set -o vi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ranger-cd() {
    tempfile="$(mktemp -t ranger-cd.XXXXXX)"
    ranger --choosedir="$tempfile" "$@"
    test -f "$tempfile" &&
        if [ "$(cat "$tempfile")" != "$(pwd)" ]; then
            cd "$(cat "$tempfile")"
        fi
    rm -f "$tempfile"
}
alias ranger='ranger-cd'


