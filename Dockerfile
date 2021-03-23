FROM ubuntu/21.04

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
    && sudo apt-get install -y \
        fzf  \
        ripgrep \ 
        threadscope \
    && sudo rm -rf /var/lib/apt/lists/* \

USER gitpod
RUN curl -sSL https://get.haskellstack.org/ | sh \
 && stack setup && stack install hlint hpack ghcid
USER root