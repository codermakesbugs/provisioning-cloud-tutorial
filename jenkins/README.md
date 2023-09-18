# Jenkins setup

## Jenkins conntainer

1. Create folder to store the configure Jenkins
```
mkdir -p jenkins_home
```

2. Create folder to store the configure Jenkins agent
```
mkdir -p jenkins_agent
```

3. Generate ssh-key store in folder ./ssh
```
ssh-keygen -t rsa -b 4096 -f $(pwd)/ssh
```