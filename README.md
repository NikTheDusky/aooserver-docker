# aooserver-docker

this is a very simple docker deployment of the AOO (Audio over OSC) server used by [SonoBus](https://www.sonobus.net/).

I wanted to use alpine as a base for the container containing the `aooserver` first, because it'd have been sized at under 10 MB, but as it turns out, aooserver is not musl / gcompat compatible and building it with statically linked libraries is pain. So, Debian Slim it is. The image is now sized at ~121 MB (for a 3 MB executable, oops), but at least it works, so, uh, whatever.

If you manage to build the container with a more resource-saving base image, feel free to leave a merge or pull request!

## repository
The repo lives on my own git server at https://git.nik.mx/nik/aooserver-docker, but is mirrored to https://codeberg.org/treat/aooserver-docker and https://github.com/NikTheDusky/aooserver-docker.

## usage

just `docker compose build && docker compose up -d` the thing and you're ready to go! It'll build and run on both `x86_64` and `arm64`. Be sure to update the base image every now and then.
the Dockerfile is compatible with podman as well, you just have to replace the `chmod=+x` flag in the `COPY` command with a chmod command two lines later.

and now go enjoy some music with friends, or jam out a bit! :3

![made with my own two paws :3](https://nik.mx/made_with_paws.gif)