FROM kayvan/signal

RUN apt-get update \
  && apt-get install -y apt-utils libgtk-3-0
  
RUN apt-get install -y signal-desktop \
  && rm -rf /var/lib/apt/lists/*

LABEL org.label-schema.version="1.0"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Signal Desktop"
LABEL org.label-schema.description="This Docker image runs Signal Desktop application using a shared X11 socket"
LABEL org.label-schema.url="https://github.com/vace117/docker-signal"
LABEL org.label-schema.docker.cmd="docker run -d -u 1000:1000 --rm -e HOME -e DISPLAY=unix:0 -e XAUTHORITY=/tmp/xauth -v $XAUTHORITY:/tmp/xauth -v $HOME:$HOME -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v /tmp/.X11-unix:/tmp/.X11-unix -w $HOME vace117/signal"
LABEL org.label-schema.vendor="vace117"

ENTRYPOINT ["/opt/Signal/signal-desktop"]
