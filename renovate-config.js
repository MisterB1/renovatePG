module.exports = {
"customManagers": [
    {
      "customType": "regex",
      "fileMatch": ["^TestDockerfile$"],
      "matchStrings": ["ENV PYTHON_VERSION=(?<currentValue>.*?)\\n"],
      "depNameTemplate": "python",
      "datasourceTemplate": "docker"
    }
  ]
}
