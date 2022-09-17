is_comment() {
  local line=$1
  [[ "${line}" == \#* ]]
}

is_empty_array() {
  [[ "$1" == "" ]]
}

array_from_file() {
  lines=()

  while read line; do
    if is_comment "${line}"; then
      continue
    fi

    lines+=( $line )
  done <$1

  echo ${lines[@]} 2> /dev/null
}
