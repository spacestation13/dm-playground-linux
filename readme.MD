# dm-playground-linux
This repo contains the buildroot configuration files to create the iso used in dm playground

1. download buildroot 2024.02 and extract to a folder.
2. install buildroot dependencies (its in their documentation)
3. shove contents of repo in <buildroot>/byondvm
4. run `make defconfig byondvm_defconfig BR2_EXTERNAL=byondvm`
5. run `make -j<cpu cores>`
6. run `make -j<cpu cores>` again (this one is short, it's because of bugs with experimental buildroot features im using(parallel building))
7. iso is in output/images


## Note
On Arch, glibc `2.36-3` has a bug where its impossible to build. At the time of writing this, there is no binary fix. However, it is possible to work around this issue by compiling glibc from source on a more recent version of `2.36`.
Bugtracker link: https://bugs.archlinux.org/task/75695