FROM busybox as temp
COPY firefox-profile.tgz /tmp
WORKDIR /tmp
RUN tar zxpf firefox-profile.tgz

FROM alpine:3.16.1
RUN apk add --no-cache \
	bash \
	firefox \
	ffmpeg \
	font-noto-cjk \
	font-noto-emoji \
	pulseaudio \
	ttf-dejavu
RUN adduser -s /bin/bash -h /home/user -D user && \
	addgroup user audio && \
	addgroup user video
COPY ./pulse-client.conf /etc/pulse
COPY ./mozilla.cfg /usr/lib/firefox
COPY ./local-settings.js /usr/lib/firefox/defaults/pref
WORKDIR /home/user
COPY --from=temp --chown=user:user /tmp/.mozilla .mozilla
USER user
CMD ["firefox", "--private-window", "about:blank"]
