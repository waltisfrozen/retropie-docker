FROM resin/rpi-raspbian
RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y --no-install-recommends ca-certificates git lsb-release sudo \
    && useradd -d /home/retropie -G sudo -m pi \
    && echo "pi ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/pi

WORKDIR /home/retropie
RUN git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git \
    && cd RetroPie-Setup \
    && sudo chmod +x retropie_setup.sh \
    && sudo ./retropie_packages.sh setup basic_install

RUN sudo rm -rf /var/lib/apt/lists/* && chown -R pi.pi /home/retropie
#ENTRYPOINT "/bin/bash"
RUN usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input pi
USER pi
ENTRYPOINT "/usr/bin/emulationstation"
CMD "#auto"
