module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": [
          "# renovate: datasource=(?<datasource>[a-z-]+?)(?: depName=(?<depName>.+?))\\s(?:ARG) .+?_VERSION=(?<currentValue>.+?)\\s"
	]
    }
  ]
}
