pytmc docker image
==================

Running an IOC:

```sh
# Ensure that docker settings are in your environment:
$ eval $(docker-machine env)
# Run pytmc:
$ docker run -im pcdshub/pytmc:v0.0.1 --help
```

Args to be passed to `pytmc` binary can be specified after the image name
above. To share a project with the container and create a database file from
its TMC file:

```sh
$ docker run -it -v /path/to/project/:/project pytmc:v0.0.0 db /project/my_tmc_file.tmc
```
