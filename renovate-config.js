module.exports = {
"platform": "github",
"autodiscover": true,
"rollbackPrs": true,
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": [
          "# renovate: datasource=(?<datasource>[a-z-]+?)(?: depName=(?<depName>.+?))\\s(?:ARG|ENV) .+?_VERSION=(?<currentValue>.+?)\\s"
	]
    }
  ]
}