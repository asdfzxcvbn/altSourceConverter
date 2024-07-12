import std/[os, strutils]
import helpers/net

proc main(): void =
  if paramCount() != 1:
    quit("usage: ./altSourceConverter <repo file>")
  
  let repoFile = paramStr(1)
  if not fileExists(repoFile):
    quit("error: repo file does not exist")

  var
    (repo, oj) = getRepo(repoFile)
    idxs = getBundleIdIndexes repo

  oj["apps"] = %*(repo.format(idxs))
  writeFile(repoFile.replace(".json", ".altsource.json"), oj.pretty())

when isMainModule:
  main()
