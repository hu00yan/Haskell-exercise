FROM haskell:latest

# Install custom tools, runtime, etc.
RUN apt-get update \
    && apt-get install -y \
        sudo \
        curl \
        fzf  \
        ripgrep \ 
        threadscope \
    && sudo rm -rf /var/lib/apt/lists/* \

USER gitpod
RUN stack install hlint hpack ghcid
USER root
