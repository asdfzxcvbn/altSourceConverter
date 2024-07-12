# altSourceConverter
convert "esign-style" repos to AltSource format, tested on apptesters repo and my repo!

## building
install [nim](https://nim-lang.org/), then clone this repo, and build with:

`nimble build -d:danger -d:strip --opt:speed`

## usage
save a repo's json data to a file, then specify it:

`./altSourceConverter $PATH_TO_REPO_FILE`

it will save the new repo data to the same directory as the file but with an `altsource.json` file extension.
