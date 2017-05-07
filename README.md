# docker-dev-tools
Dockerized tools for development. The tools in this container are:

- openssl
- git

# Tools

- [Creating self signed certificates](#self-signed-certificates)
- [Using git](#git)

## <a name="self-signed-certificates">Self signed certificates

This was unshamesly borrowed from [https://codefresh.io/blog/using-docker-generate-ssl-certificates/](https://codefresh.io/blog/using-docker-generate-ssl-certificates/) :-)

### Generate CSR
```bash
docker run --rm -v $PWD:/work -it aspgems/dev-tools openssl req -out /work/CSR.csr -new
```

### Generate certificate
```bash
docker run -v $PWD:/work -it aspgems/dev-tools openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privatekey.key -out /work/certificate.crt
```
## <a name="git"> Git
You can use this tool by running the following command fron the root of your application

```bash
docker run --rm -v $(pwd):/work -v ~/.ssh/id_rsa:/root/.ssh/id_rsa aspgems/dev-tools git
```

If you want, for example, clone a repo, you should do something like the following

```bash
docker run --rm -v $(pwd):/work -v ~/.ssh/id_rsa:/root/.ssh/id_rsa aspgems/dev-tools git clone <your_repo_url>
```

### Adding yuor own .gitconfig
```bash
docker run --rm -v $(pwd):/work -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ~/.gitconfig:/root/.gitconfig aspgems/dev-tools git
```

**Configuring your public key:** This assumes that your id_rsa file resides in
~/.ssh/id_rsa. If you have your public key in other location, you should change that route.

**File permissions:** The files generated under vendor/bundle will belong to root user. You may need the ownership of this directory to match your user.

```bash
sudo chown -R your_user:your_group vendor/bundle
```
