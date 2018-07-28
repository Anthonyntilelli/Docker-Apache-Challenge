# Test Certificates for Apache Web server.
  > _DO NOT_ use in Production


## Use Full Commands:

#### Generate Self Signed Cert and Key
  ```shell
  openssl req \
         -newkey rsa:2048 -nodes -keyout domain.key \
         -x509 -days 365 -out domain.crt
  ```

#### View Cert
  ```shell
    openssl x509 -text -noout -in domain.crt
  ```
#### Verify Key
  ```shell
  openssl rsa -check -in domain.key
  ```

[See more here](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)