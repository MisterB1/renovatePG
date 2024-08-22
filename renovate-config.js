module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": [
          "# renovate: datasourceTemplate=(?<datasourceTemplate>[a-z-]+?)(?: depNameTemplate=(?<depNameTemplate>.+?))\\s(?:ARG) .+?_VERSION=(?<currentValue>.+?)\\s"
	],
    }
  ]
}
