## Dockerizing GUI applications for XServer

I wanted to be able to use some graphical applications such as Quartus-Lite (Intel FPGA tools) on my linux distro of my choice. However, most of the times, unless one has Ubuntu distribution the application may not support random distribution or the version of the supported distribution can be old. An easy way to solve this is to containerize the application and use your host's XServer (It works also for Wayland).

The current tested setup is: Manjaro (Ornara) 21.0.4 with Linux Kernel 5.9.16
The Dockerfile is, by default, installs `Firefox` as an example GUI application
There are some caviats that I couldn't solve such as `xauth list` and `.XAuthority`.

To try it, please checkout the `run.sh` script
