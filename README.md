Description
===========

Image based on Alpine Linux with the following tools:
* dotnet runtime
* bash

Using the prebuilt image
========================

The public Docker Hub repository is here:
https://hub.docker.com/r/sraillard/dotnet-runtime

To run it in interactive mode:
```
docker run --rm -it sraillard/dotnet-runtime:3.1.9-alpine3.12
```

Building
========

```
docker build --tag sraillard/dotnet-runtime:3.1.9-alpine3.12 .
```
