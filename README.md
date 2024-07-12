# altSourceConverter
convert "esign-style" repos to AltSource format, tested on the apptesters repo, eeveespotify repo, and my repo!

this can come in helpful in the case you want to explore the repo with [altsource-viewer](https://github.com/therealFoxster/altsource-viewer), or just make a repo compatible with altstore (hopefully...)

## building
install [nim](https://nim-lang.org/), then clone this repo, and build with:

`nimble build -d:danger -d:strip --opt:speed`

## usage
save a repo's json data to a file, then specify it:

`./altSourceConverter $PATH_TO_REPO_FILE`

it will save the new repo data to the same directory as the file but with an `altsource.json` file extension.
