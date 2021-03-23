FROM ubuntu:21.04

# Install custom tools, runtime, etc.
RUN apt-get update \
    && apt-get install -y \
        sudo \
        fzf  \
        ripgrep \ 
        threadscope \
    && sudo rm -rf /var/lib/apt/lists/* \

USER gitpod
RUN curl -sSL https://get.haskellstack.org/ | sh \
 && stack setup && stack install hlint hpack ghcid
USER root
