# true

Sample project that use packer to deliver a container app.

1. Using packer we build our build environment
2. Using packer we compile our application
3. Create docker from scratch + application.

inspired in `https://github.com/tianon/dockerfiles/tree/master/true`

## requirements

linux + docker + packer

##

Our generated box:

```bash
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
true                latest              504d5ac195fd        16 seconds ago      125 B
```

# Sample run

```bash
$ make test
docker run --rm true && echo "true" || echo "false"
true
```

## build

make

ie:
```bash
$ make
docker output will be in this color.

==> docker: Creating a temporary directory for sharing data...
==> docker: Pulling Docker image: alpine:latest
    docker: latest: Pulling from library/alpine
    docker: 4d06f2521e4f: Already exists
    docker: Digest: sha256:7739b19a213f3a0aa8dacbd5898c8bd467e6eaf71074296a3d75824e76257396
    docker: Status: Image is up to date for alpine:latest
==> docker: Starting docker container...
    docker: Run command: docker run -v /home/kikitux/.packer.d/tmp/packer-docker831245654:/packer-files -d -i -t alpine:latest /bin/sh -l
    docker: Container ID: 27844b7e9c9752068e51aafaa7748f692ceb44b148287f420445af915ecae239
==> docker: Provisioning with shell script: /tmp/packer-shell684946131
    docker: http://dl-cdn.alpinelinux.org/alpine/v3.3/community
    docker: fetch http://dl-cdn.alpinelinux.org/alpine/v3.3/main/x86_64/APKINDEX.tar.gz
    docker: fetch http://dl-cdn.alpinelinux.org/alpine/v3.3/community/x86_64/APKINDEX.tar.gz
    docker: v3.3.2-20-g98a1941 [http://dl-cdn.alpinelinux.org/alpine/v3.3/main]
    docker: v3.3.1-122-g47d8282 [http://dl-cdn.alpinelinux.org/alpine/v3.3/community]
    docker: OK: 5856 distinct packages available
    docker: (1/1) Installing nasm (2.11.08-r0)
    docker: Executing busybox-1.24.1-r7.trigger
    docker: OK: 7 MiB in 12 packages
==> docker: Committing the container
    docker: Image ID: sha256:1a49f72471a6d17351fc48f56bf59817972caf8c7b957f74eba89c7c62ccd8c1
==> docker: Killing the container: 27844b7e9c9752068e51aafaa7748f692ceb44b148287f420445af915ecae239
==> docker: Running post-processor: docker-tag
    docker (docker-tag): Tagging image: sha256:1a49f72471a6d17351fc48f56bf59817972caf8c7b957f74eba89c7c62ccd8c1
    docker (docker-tag): Repository: alpine-nasm:latest
Build 'docker' finished.

==> Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:1a49f72471a6d17351fc48f56bf59817972caf8c7b957f74eba89c7c62ccd8c1
--> docker: Imported Docker image: alpine-nasm:latest
alpine output will be in this color.

==> alpine: Creating a temporary directory for sharing data...
==> alpine: Starting docker container...
    alpine: Run command: docker run -v /home/kikitux/.packer.d/tmp/packer-docker195822872:/packer-files -d -i -t alpine-nasm /bin/sh -l
    alpine: Container ID: cf66547776c71d0bc1b766b7f5db5b13fcd8529e890096771b1cb4f139219402
==> alpine: Uploading true.asm => true.asm
==> alpine: Provisioning with shell script: /tmp/packer-shell697398790
==> alpine: Downloading true.tar => true.tar
==> alpine: Killing the container: cf66547776c71d0bc1b766b7f5db5b13fcd8529e890096771b1cb4f139219402
Build 'alpine' finished.

==> Builds finished. The artifacts of successful builds are:
--> alpine: Exported Docker file: 
Sending build context to Docker daemon 92.16 kB
Step 1 : FROM scratch
 ---> 
Step 2 : ADD true.tar /
 ---> 15035490323e
Removing intermediate container d6c34465cf7f
Step 3 : ENTRYPOINT /true
 ---> Running in 48801489393b
 ---> bbce4891ab7d
Removing intermediate container 48801489393b
Successfully built bbce4891ab7d
Sending build context to Docker daemon 92.16 kB
Step 1 : FROM scratch
 ---> 
Step 2 : ADD true.tar /
 ---> Using cache
 ---> 15035490323e
Step 3 : ENTRYPOINT /true
 ---> Using cache
 ---> bbce4891ab7d
Successfully built bbce4891ab7d
```

