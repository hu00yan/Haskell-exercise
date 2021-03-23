FROM haskell:latest

# Install custom tools, runtime, etc.
RUN apt-get update \
    && apt-get install -y \
        sudo \
        fzf  \
        ripgrep \ 
        threadscope \
    && rm -rf /var/lib/apt/lists/* \
    
RUN stack install hlint hpack ghcid
