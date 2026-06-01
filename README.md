This is a simple, self-containerd jenkins deployment that uses docker-in-docker.

```
$ docker compose up --build
```

This will build a jenkins image from `jenkins/jenkins:alpine`, add `docker` and a few other things and then fire everything up.  

The `jenkins` webui will be exposed on port 8080.  Watch the logs of the `jenkins` service to get the admin password.

todo: set up sudo with NOPASSWD for user jenkins
