# Petalinux 2017.1 Dockerfile

Fork of [queeno/docker-ubuntu-desktop](https://github.com/queeno/docker-ubuntu-desktop) designed to contain [Petalinux 2017.1](http://www.wiki.xilinx.com/PetaLinux+Getting+Started) and its dependency [Xilinx SDK](https://www.xilinx.com/products/design-tools/embedded-software/sdk.html).

# How to run

You can use the ```run.sh``` script to run the petalinux image and specify whether or not you want the vnc server mode (if you need to run th XSDK gui) or the petalinux mode:

```bash
$ ./run.sh vnc
$ ./run.sh petalinux
```

# How to build

1. Place [petalinux-v2017.1-final-installer.run](https://www.xilinx.com/member/forms/download/xef.html?filename=petalinux-v2017.1-final-installer.run&akdm=1) and [Xilinx_SDK_2017.1_0415_1_Lin64.bin](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2017-1.html) in ```resources``` directory.

2. Run the server script to start a simple python server

```bash
./server.sh
```

3. Run build script:

```bash
$ ./build.sh
```

4. Start container in VNC mode:
```bash
$./run.sh vnc
```

5. Use a [VNC client](https://help.ubuntu.com/community/VNC/Clients) to connect to the container on port 5901 localhost:1.  I recommend [Remmina Remote Desktop Client](https://www.remmina.org/wp/) that comes with Ubuntu 16.04. **The password is "password"**

6. Run the **Xilinx_SDK_2017.1_0415_1_Lin64.bin** executable and follow the prompts to install the **Xilinx SDK**:

```bash
$ ./Xilinx_SDK_2017.1_0415_1_Lin64.bin
```

7. Exit the container and use ```Ctrl-c``` to kill the vnc server.

8. Outside of the container on your host machine run the commit script to save the installation:

```bash
./commit.sh
```

9. Run the container in petalinux mode:

```bash
./run.sh
```

10. Source the newly available ```settings.sh``` script in ```/opt/Xilinx/settings.sh```:

```bash
$ source /opt/Xilinx/settings.sh
```

11. Inside the container run the **petalinux-v2017.1-final-installer.run** executable and specify the ```/opt``` directory as an argument:
```
./petalinux-v2017.1-final-installer.run /opt
```

12. Follow the prompts to install petalinux

13. Add a script to your bash profile to source the ```/opt/Xilinx/settings.sh``` script and the ```/opt/settings.sh``` petalinux script:

```bash
echo "source /opt/Xilinx/settings.sh\rsource /opt/settings.sh" >> ~/.bashrc
```

14. Run the ```commit.sh``` script again to save the petalinux installation.
