# Detection of interactivility

case $- in
  *i*) ;; 
  *) return
esac

havecmd () {
  type "$1" &> /dev/null
  return $?
}
