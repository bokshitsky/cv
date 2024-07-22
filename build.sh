set -e

docker run -v "$(pwd)":/usr/src/tex --rm rekka/tectonic tectonic cv.tex

if [[ `git status --porcelain` ]]; then
  git config user.email "bokshitsy@gmail.com"
  git config user.name "Evgeny Bokshitsky"
  git add cv.pdf
  git commit -m "generate new pdf"
  git push
fi
