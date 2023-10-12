# Nginx

## Cloud machine
1. Add this [file](cloud.conf) to `/etc/nginx/conf.d/`

2. Connect machine to Tailscale VPN.
Add your Tailscale IP device to this file file `/etc/hosts` with dns name `jenkins` and `artifactory`

- Example: `jenkins        100.100.100.100`
- Example: `artifactory    100.100.100.100`

3. Config TLS
- Install tool
```
apt-get update
sudo apt-get install certbot
apt-get install python3-certbot-nginx
```

- Run the following command to generate certificates with the NGINX plug‑in:

```
sudo certbot --nginx -d {{ your DNS }}
```

4. Automatically Renew Let's Encrypt Certificates.

- Open the crontab file.
```
crontab -e
```

- Add the certbot command to run daily. In this example, we run the command every day at noon. The command checks to see if the certificate on the server will expire within the next 30 days, and renews it if so. The --quiet directive tells certbot not to generate output.
```
0 12 * * * /usr/bin/certbot renew --quiet

```