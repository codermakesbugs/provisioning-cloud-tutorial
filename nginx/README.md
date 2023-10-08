# Nginx

## Local mechine
Connect machine to tailscale VPN.
Add your tailscale ip device to this file file `/etc/hosts` with dns name `homelab`
Example:
```
homelab    100.100.100.100
```

## Cloud mechine
Connect machine to tailscale VPN.
Add the [file](cloud.conf) to `/etc/nginx/conf.d/`