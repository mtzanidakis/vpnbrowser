FROM archlinux
RUN yes | pacman -Sy ttf-liberation firefox firefox-ublock-origin firefox-extension-privacybadger
RUN yes | yes | pacman -Scc
RUN useradd -s /bin/bash -d /home/user -m -G audio,video user
COPY ./pulse-client.conf /etc/pulse
USER user
CMD ["firefox", "--private-window", "about:blank"]
