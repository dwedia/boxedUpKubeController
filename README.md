# Boxed Up Kube Controller

This container is build as an appliance for my own needs, for managing kubernetes clusters.

It is built on Alpine Linux, and has a few preinstall programs.
 - kubectl
 - helm
 - talosctl

In this repo is a folder called `configs`. This folder gets bind mounted in to the container, when we run podman-compose up. 
Inside this folder is a filed called setenv.sh. This file sets a few environment variables, and gets run automatically, when the container starts up.

The variables are as follows:
```bash
#talosctl environment variables:
export CONTROL_PLANE_IP=<SET_CONTROL_PLANE_IP_HERE>
export CLUSTER_NAME=laptopserver
export TALOSCONFIG=/kubecontrol/configs/talosconfig

#Kubectl environment variables:
export KUBECONFIG=/kubecontrol/configs/kubeconfig
```

This means that if you drop in your `kubeconfig` file in to this folder, and make sure its name `kubeconfig`, the container will automatically pick it up and set it as the KUBECONFIG environment variable.
If you use Talos OS, the same goes for the talosconfig file. Drop it in the `configs` folder, and the container will pick it up.

## Building the container.
For now, I have not publish this container to a container registry yet, so at moment, you need to build the container, to use it.

To make this easy, I have made a `build.sh` script. This just runs the `podman build` command.

## Running the container.
I use `podman-compose` to run the container (docker compose, if you want to use docker).

```bash
$ podman-compose up -d
ceb010974f7de16531bcb8ce982cde6307d7a686ca8c2f20241ab4977b530de4
b45099fc95c7ee7f5e18be77d09462d79add7e4f9431f73eb7e5437c25f91dd8
kubecontroller
```

If you want to use `podman run` instead (docker run, if you want to use docker)
```bash
$ podman run -itd --name kubecontroller -v ./configs:/kubecontrol/configs:Z localhost/boxedupkubecontroller
68096d7f068d344cc25ee9a7573f17ca4831a4153adfbc26b9d1ed742774f912
```

## Using the container.
To use the container, you can exec in to the container with the `podman exec` command.
```bash
podman exec -it kubecontroller bash
```

Like for the build command, I have made a `enter.sh` script, that just runs the above `podman exec` command

## Note if you use docker.
I use podman, but if you use docker instead, just substitute docker for podman in the commands here. they are a dropin replacement for eachother for the things i do here.