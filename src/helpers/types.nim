import std/[json, tables]
export json, tables

type
  OrigApp* = object
    name*: string
    bundleIdentifier*: string
    version*: string
    versionDate*: string
    size*: int
    downloadURL*: string
    localizedDescription*: string
    iconURL*: string

  OrigRepo* = ref object
    apps*: seq[OrigApp]

type
  ASPermissions* = object
    entitlements*: JsonNode
    privacy*: JsonNode

  ASAppVersion* = ref object
    version*: string
    date*: string
    localizedDescription*: string
    downloadURL*: string
    size*: int

  ASApp* = ref object
    name*: string
    bundleIdentifier*: string
    developerName* = ""
    # subtitle* = ""
    localizedDescription* = ""
    iconURL*: string
    versions*: seq[ASAppVersion]
    appPermissions*: ASPermissions

  ASApps* = seq[ASApp]

type
  ## maps bundle id -> indexes found
  DDResult* = OrderedTableRef[string, seq[int]]
