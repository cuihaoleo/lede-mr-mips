 ## lede-mr-mips

A naive try to bring LEDE to Mikrotik metarouter platform.

### Introduction

Metarouter is a virtualization feature shipped in Mikrotik RouterOS. It has the ability to import custom images as Metarouter guests. Mikrotik released [OpenWRT patches and images](https://wiki.mikrotik.com/wiki/Manual:Metarouter#OpenWRT_as_virtual_machine) (with 2.6.31 kernel) in around 2010. But they have never updated it since then.

Some kind Mikrotik users migrate the patches to newer kernels:

- **liquidcz** from Mikrotik forum migrate the patches to OpenWRT 12.09 with 3.3 kernel: [link](http://openwrt.wk.cz/)
- **hecke**, based on liquidcz's work, release the patches for OpenWRT 14.07 with 3.10 kernel: [link](http://openwrt.naberius.de/barrier_breaker/mr-mips/openwrt_metarouter_1407.patch)

3 years has passed since OpenWRT 14.07 released and 3.3 / 3.10 kernel branches have been EOL. To enjoy latest bugfixes and features, I based on hecke's work to bring Metarouter support to LEDE (successor of OpenWRT project).

Migration to newer kernels requires more changes to old patches. Latest LEDE v17.01.4 uses 4.4 kernel as baseline and 3.18 for platforms lacking of supports. I only bump kernel version to 3.18.43.

I only test on my RB2011UiAS-RM router. Theoretically the patches should work on other MIPS boards (at least RB2011 series). Support for PPC boards are removed because I don't have one.

### Usage

Please follow [LEDE official guides](https://lede-project.org/docs/guide-developer/use-buildsystem) to build the image and software packages.

After checking out LEDE v17.01.4 sources, put this project inside LEDE source tree:

```bash
$ cd path/to/lede/source/
$ git clone https://github.com/cuihaoleo/lede-mr-mips target/linux/mr-mips
```

In the step of `make menuconfig`, select `Mikrotik MetaROUTER MIPS` as target platform.

I provide an example config in ` misc/lede-config`. It should work out-of-box. You may use it if you don't want to customize kernel:

```bash
$ cp target/linux/mr-mips/misc/lede-config .config
$ make oldconfig
```

### Disclaimer

I am familiar with neither Linux kernel nor LEDE/OpenWRT build system. This is the first time that I deal with kernel sources. I change the code just based on my intuition of a programmer.

Don't blame me if this project break your router!