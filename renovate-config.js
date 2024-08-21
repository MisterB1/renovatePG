module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": ["ENV YARN_VERSION=(?<currentValue>.*?)\\n"],
      "depNameTemplate": "yarn",
      "datasourceTemplate": "npm"
    },
    {
      "customType": "regex",
      "fileMatch": ["^Dockerfile$"],
      "matchStrings": ["ENV PYTHON_VERSION=(?<currentValue>.*?)\\n"],
      "depNameTemplate": "python",
      "datasourceTemplate": "docker"
    }
  ]
}
