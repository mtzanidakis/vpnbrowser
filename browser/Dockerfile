FROM alpine:3.23
RUN apk -U upgrade --no-cache && apk add --no-cache \
	bash \
	curl \
	firefox \
	ffmpeg \
	font-noto-cjk \
	font-noto-emoji \
	intel-media-driver \
	mesa-dri-gallium \
	mesa-va-gallium \
	pulseaudio \
	ttf-dejavu
RUN adduser -s /bin/bash -h /home/user -D user && \
	addgroup user audio && \
	addgroup user video && \
	addgroup user tape
COPY ./pulse-client.conf /etc/pulse
COPY ./mozilla.cfg /usr/lib/firefox
COPY ./local-settings.js /usr/lib/firefox/defaults/pref
COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
WORKDIR /home/user
USER user
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
