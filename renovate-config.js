module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": ["ARG FRREXPORTER_VERSION=v(?<currentValue>.*?)\\n"],
      "depNameTemplate": "github.com/tynany/frr_exporter",
      "datasourceTemplate": "go"
    }
  ]
}
