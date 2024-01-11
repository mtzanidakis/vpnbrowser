FROM busybox as temp
COPY firefox-profile.tgz /tmp
WORKDIR /tmp
RUN tar zxpf firefox-profile.tgz

FROM alpine:3.19
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
WORKDIR /home/user
COPY --from=temp --chown=user:user /tmp/.mozilla .mozilla
USER user
CMD ["firefox", "--private-window", "about:blank"]
