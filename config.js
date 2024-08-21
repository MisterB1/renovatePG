{
  "customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": ["ARG FRREXPORTER_VERSION=v(?<currentValue>.*?)"],
      "depNameTemplate": "github.com/tynany/frr_exporter",
      "datasourceTemplate": "go"
    }
  ]
}
