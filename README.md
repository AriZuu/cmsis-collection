Helper for compiling CMSIS (and various device-specific libraries) for pico]OS projects.

Each device-specific cmsis is compiled from it's own subdirectory. CMSIS source code
is not distributed, this system expects to find it from ../cmsis-dist/some-vendor-specific-directory.
This is because I don't want to figure out if each vendor allows redistribution
of their code.

Library Makefile copies necessary source code and headers from ../cmsis-dist into $(CMSIS)/src and
$(CMSIS)/inc. If any patching for source is needed, it is done after copying.

To add a new CMSIS library to this collection, simply make a new subdirectory for it.
This subdirectory name should match to $(CMSIS) Makefile variable setting you will have.
Copy cmsis.mak from one of the exiting cmsis directories to your new directory and
edit it to copy and patch files as necessary.

