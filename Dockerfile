FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
        git \
        python \
        python-dev \
        python-pip \
        libxml2-dev \
        libxslt1-dev \
        libz-dev curl \
    && cd / \
    && git clone https://bitbucket.org/LaNMaSteR53/recon-ng.git \
    && cd recon-ng \
    && pip install -U -r REQUIREMENTS

COPY script.rng /recon-ng/script.rng

ENV HOME /recon-ng
RUN useradd -m recon -d /recon-ng && chown -R recon:recon /recon-ng

USER recon

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/recon-ng/recon-ng", "--no-analytics", "--no-check", "-r", "/recon-ng/script.rng" ]
