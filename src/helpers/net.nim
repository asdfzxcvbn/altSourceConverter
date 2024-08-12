import std/enumerate
import jsony
import types

export json

proc getRepo*(file: string): (OrigRepo, JsonNode) =
  let data = readFile(file)
  return (data.fromJson(OrigRepo), data.fromJson())

proc getBundleIdIndexes*(repo: OrigRepo): DDResult =
  result = newOrderedTable[string, seq[int]]()  # required for whatever reason
  for ind, app in enumerate repo.apps:
    try:
      result[app.bundleIdentifier].add(ind)
    except KeyError:
      result[app.bundleIdentifier] = @[ind]

proc format*(repo: OrigRepo; found: DDResult): ASApps =
  let empty = newJArray()
  
  for bundle, idxs in found.pairs:
    var
      orig: OrigApp = repo.apps[idxs[0]]
      app = ASApp(
        name: orig.name,
        bundleIdentifier: bundle,
        iconURL: orig.iconURL,
        versions: @[],
        appPermissions: ASPermissions(entitlements: empty, privacy: empty)
      )
    
    for idx in idxs:
      let origIdx = repo.apps[idx]
      app.versions.add(ASAppVersion(
        version: origIdx.version,
        date: origIdx.versionDate,
        localizedDescription: origIdx.localizedDescription,
        downloadURL: origIdx.downloadURL,
        size: origIdx.size
      ))
    
    app.downloadURL = app.versions[0].downloadURL
    result.add(app)

