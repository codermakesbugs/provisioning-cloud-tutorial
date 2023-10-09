# Jfrog Artifactory Guide

## Using Artifactory Open Source

### Prepare path jfrog-home to store data
- Change owner for `jfrog-home` to 1030:1030
```
sudo chown 1030:1030 -R jfrog-home
```

### Using docker-compose to start

Can see in this [file](../compose.yaml)