# zig-docker-build-shell
A shell to build zig without any specific demands on your host system. Tested on Manjaro, but should work on any docker-capable linux.

## Usage
First of all you need to clone the repositories listed in the `.env`. Make sure they are placed in the same directory as contents of this repository. 
**All steps will be performed on your host machine's file system. This script only sets up an environment for building and does not perform the build itself!**.

Ideally this is all you need to do:

```bash
./shell.sh
```

