FROM archlinux:multilib-devel

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm \
    git \
    rust \
    sudo

RUN useradd -m -G wheel user && \
    passwd -d user

RUN sed -i '/# %wheel ALL=(ALL:ALL) ALL/s/^#//' /etc/sudoers

USER user

WORKDIR /home/user

RUN git clone https://aur.archlinux.org/paru.git && \
    cd paru && \
    makepkg -si --noconfirm
