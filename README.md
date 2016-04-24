# geeknote-container
geeknote requires some none-standard python packages which are not usually
packaged in Linux distributions. Installing python packages with pip in a
distribution may overwrite files installed by the distribution package
management and is thus best avoided in standard installations.

Running geeknote in a docker container is a quick and simple solution
for this. The original idea has been copied from [seiti/geeknote-container](https://github.com/seiti/geeknote-container).
This container differs from the orginal in the following ways:
- vim has been added to make `geeknote edit` work.
- the vim "plasticbox" plugin has been added (markdown mode).
- the container is based on debian:testing rather than python:2. As far as they are available, original debian python packages are used. Only those packages that I didn't found on debian are installed using pip. Therefore we don't have the latest + greatest Python code, but we have a clean Debian installation to the maximum possible extent, and the resulting image is much smaller.

## Sample start script
```
cat >$HOME/bin/gn <<EOF
#! /bin/bash
exec docker run -it -v $HOME/.geeknote:/root/.geeknote --rm mwilck/geeknote:latest "$@"
EOF
```
This `gn` script can be used in the same way as geeknote itself.

Thanks to @seiti for the original idea. Suggestions for improvement are welcome.
