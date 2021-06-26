FROM archlinux
RUN pacman -Sy --noconfirm \
	ttf-liberation \
	firefox \
	firefox-ublock-origin \
	firefox-extension-privacybadger && \
	rm -rf -- /var/cache/pacman/pkg/* && \
	useradd -s /bin/bash -d /home/user -m -G audio,video user
COPY ./pulse-client.conf /etc/pulse
COPY ./mozilla.cfg /usr/lib/firefox
COPY ./local-settings.js /usr/lib/firefox/defaults/pref
USER user
CMD ["firefox", "--private-window", "about:blank"]
