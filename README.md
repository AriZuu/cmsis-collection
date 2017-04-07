Helper for compiling CMSIS (and various device-specific libraries) for pico]OS projects.

Each device-specific cmsis is compiled from it's own subdirectory. CMSIS source code
is not distributed, this system expects to find it from ../distfiles/some-vendor-specific.zip.
This is because I don't want to figure out if each vendor allows redistribution
of their code.

Library Makefile copies necessary source code and headers from ../distfiles into subdir/src and
subdir/inc. If any patching for source is needed, it is done after copying (this works
a little bit like FreeBSD ports system, except it doesn't download distribution files automatically).

To add a new CMSIS library to this collection, simply make a new subdirectory for it.
Copy Makefile and Makefile.lib from one of the exiting cmsis directories to your new directory and
edit it to copy and patch files as necessary.
