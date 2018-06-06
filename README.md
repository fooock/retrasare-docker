# Docker for RetroShare
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile to start RetroShare in `no-gui` mode

## Build
Build the `Dockerfile` before execute it

```bash
$ docker build -t retroshare:0.1 .
```

When done, execute it indicating the port to access the web ui

```bash
$ docker run -p 9090:9090 retroshare
```
