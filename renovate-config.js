module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": ["ENV PYTHON_VERSION=(?<currentValue>.*?)\\n"],
      "depNameTemplate": "python",
      "datasourceTemplate": "docker"
    }
  ]
}
