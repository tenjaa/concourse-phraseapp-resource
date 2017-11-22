# Concourse PhraseApp Resource
A concourse resource that triggers on changes in PhraseApp

##Usage
``` yaml
resource_types:
- name: phraseapp-resource
  type: docker-image
  source:
    repository: tenjaa/concourse-phraseapp-resource
    tag: latest

resources:
  - name: some-git-repo
    type: git
    source:
      uri: some-url-to-a-git-repo
      branch: master
      username: your-username
      password: your-password
  - name: phraseapp
    type: phraseapp-resource
    source:
      access_token: your-read-only-token-to-access-phraseapp
      project_id: the-id-of-the-project-you-want-to-check

jobs:
  - name: update translations
    plan:
    - get: phraseapp
      trigger: true
    - get: some-git-repo
    - task: update translations
      file: repo/ci/update.yml
    - put: repo
      params:
        repository: modified-repo
```
