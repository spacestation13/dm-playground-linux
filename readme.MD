1. download buildroot 2021.02.8 and extract to folder, for the sake of these instructions, that folder is <buildroot>/
2. install buildroot dependencies (its in their documentation)
3. shove contents of repo in <buildroot>/byondvm
4. run `make defconfig byondvm_defconfig BR2_EXTERNAL=byondvm`
5. run `make -j<cpu cores>`
6. run `make -j<cpu cores>` again (this one is short, its because of bugs with experimental buildroot features im using(parallel building))
7. iso is in output/images