## MWE: Rust cross compile OSX->rpi0 in Docker

 - Build environment: OSX (64bit intel)
 - Run environment: raspberry pi 0 2W (64bit arm)

### Quickstart:

On your mac:

 - Clone this repo and have a hub.docker.com account and credentials handy.
 - Build the goods inside a container: `docker image build -t <dockerhub username>/rustdemo:rpi`
 - Push your container up to dockerhub: `docker image push <dockerhub username>/rustdemo:rpi`

On your rpi0 2w
 - Pull your image: `docker image pull <dockerhub username>/rustdemo:rpi`
 - Runnit: `docker container run <dockerhub username>/rustdemo:rpi ./hello`

### Tricksy Parts

 - See the Dockerfile for the detailed steps. This hello world example can in principle be replaced with a real application by replacing `Cargo.toml` and the contents of `src` with the guts of your app.
 - Cross-compilation magic is in two places:
   - The `--target` flag in the `cargo build` step targets the appropriate chip arch
   - Also don't miss the contents of `config`; this sets the linker correctly for our preferred arch.

### Props

 - This demo based closely on https://jakewharton.com/cross-compiling-static-rust-binaries-in-docker-for-raspberry-pi/, with minor Docker massaging.
