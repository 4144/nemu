macro(build_qemu)
  include(ExternalProject)
  include(ProcessorCount)

  processorcount(N_CPUS)

  ExternalProject_Add(
    qemu
    PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/qemu
    URL https://download.qemu.org/qemu-4.2.0.tar.bz2
    URL_MD5 26ddfb869e6f842f4c7839baddef6312
    PATCH_COMMAND
      ${PATCH_COMMAND} -p1 -i
      ${CMAKE_CURRENT_SOURCE_DIR}/patches/qemu-qmp-savevm-4.2.0.patch
    CONFIGURE_COMMAND
      ${CMAKE_CURRENT_SOURCE_DIR}/qemu/src/qemu/configure
      --prefix=${CMAKE_CURRENT_BINARY_DIR}/qemu/${CMAKE_INSTALL_DATAROOTDIR}/nemu/qemu
      --enable-system
      --disable-docs
      --disable-guest-agent
      --enable-pie
      --disable-debug-info
      --disable-debug-tcg
      --disable-gnutls
      --disable-nettle
      --disable-gcrypt
      --disable-sdl
      --disable-sdl-image
      --disable-gtk
      --disable-vte
      --disable-curses
      --enable-vnc
      --enable-vnc-jpeg
      --enable-vnc-png
      --disable-vnc-sasl
      --enable-virtfs
      --disable-xen
      --disable-xen-pci-passthrough
      --disable-brlapi
      --enable-curl
      --enable-fdt
      --disable-bluez
      --enable-kvm
      --disable-rdma
      --disable-vde
      --disable-netmap
      --enable-linux-aio
      --enable-cap-ng
      --enable-attr
      --enable-vhost-net
      --enable-vhost-crypto
      --enable-vhost-kernel
      --enable-vhost-user
      --enable-spice
      --disable-rbd
      --disable-libiscsi
      --disable-libnfs
      --disable-smartcard
      --enable-libusb
      --enable-live-block-migration
      --enable-usb-redir
      --disable-lzo
      --disable-snappy
      --enable-bzip2
      --disable-lzfse
      --enable-seccomp
      --enable-coroutine-pool
      --disable-glusterfs
      --enable-tpm
      --disable-libssh
      --disable-numa
      --enable-libxml2
      --disable-tcmalloc
      --disable-jemalloc
      --disable-opengl
      --disable-virglrenderer
      --disable-xfsctl
      --disable-qom-cast-debug
      --enable-tools
      --disable-vxhs
      --enable-bochs
      --enable-cloop
      --enable-dmg
      --enable-qcow1
      --enable-vdi
      --enable-vvfat
      --enable-vvfat
      --enable-qed
      --enable-parallels
      --enable-sheepdog
      --disable-capstone
      --disable-debug-mutex
      --disable-libpmem
      --disable-xkbcommon
      --target-list=${NM_QEMU_TARGET_LIST}
    BUILD_COMMAND make -j ${N_CPUS})

endmacro(build_qemu)