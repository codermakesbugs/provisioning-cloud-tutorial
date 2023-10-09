# GitHub Guide

## Setup GitHub App
- Access Settings
- Access Developer settings
- New GitHub App
- After created. Access to view detail.
- Generate a new client secret
- Generate private key. Store it.
- Decrypt private key. This key after decrypting will use to create the credential GitHub App on Jenkins.

```
openssl pkcs8 -topk8 -inform PEM -outform PEM -in .private-key.pem -out converted-github-app.pem -nocrypt
```

## Setup webhook without GitHub App

1. Using ngrok to public Payload URL 

```
ngrok http 8088
```

2. Access repository want to config webhoook
- Access Settings
- Access Webhooks. Add webhook
- Payload URL = `{Your Forwarding after running ngrok}/github-webhook/`
- Which events would you like to trigger this webhook? You can choose Send me everything. make easily done.
- Checking status after configure.
