# Jenkins Docker Setup 

### Jenkins

Create folder to store the configure Jenkins
```
mkdir -p jenkins_home
```

### Jenkins agent
Create folder to store the configure Jenkins agent
```
mkdir -p jenkins_agent
```

### SSH 
Generate ssh-key store in folder ./ssh. Will mount it in [compose.yaml](../compose.yaml)
```
ssh-keygen -t rsa -b 4096 -f $(pwd)/ssh
```

## Setup Agent container

### Access to agent container
```
docker exec -it agent bash
```

### Update package and install packages
```
apt update
apt install ufw docker.io openssh-server net-tools
```

### Open port 22 to use SSH
```
ufw allow ssh
ufw enable
```

### Checking sshd status
```
netstat -plant | grep :22
```

### If sshd is downed let restart sshd
```
/usr/sbin/sshd start
```

## docker.sock
Checking user and group after mount it. If its group id does't the same with user docker in the container. Change the group id to the same.
```
groupmod -g {new-id} docker
```

# Setup Jenkin agent node.

## Configure credential
### Create credential to use acess agent
```
Dashboard -> Manage Jenkins -> Credetials -> Global credentials -> Add credential
```
#### Add credential kind `SSH username with private key`

## Setup node

### Create a new node
```
Dashboard -> Manage Jenkins -> Node -> New Node
```
### Configure node
1. Set `Remote root directory` to `/home/jenkins/agents`
2. Set `Labels` to `agent-docker` will use it [Jenkinsfile](Jenkinsfile)
3. Set Usage to `Use this node as much as possible`
4. Launch method choose `Launch agent via SSH`. Hostname can see networks aliases in the [link](../compose.yaml) 
```
Host: agent-docker
Credentials: select existed by before step
Host Key Verification Strategy: Non verifying Verification Strategy
```

