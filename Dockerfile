FROM resin/rpi-raspbian
RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y --no-install-recommends ca-certificates git lsb-release sudo \
    && useradd -d /home/retropie -G sudo -m retropie \
    && echo "retropie ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/retropie
USER retropie

WORKDIR /home/retropie
RUN git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git \
    && cd RetroPie-Setup \
    && sudo chmod +x retropie_setup.sh \
    && sudo ./retropie_packages.sh setup basic_install \
    && sudo rm -rf /var/lib/apt/lists/*   
ENTRYPOINT "/usr/bin/emulationstation"
CMD "#auto"

