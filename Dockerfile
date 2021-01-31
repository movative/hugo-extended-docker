FROM alpine:latest
LABEL maintainer="38313840+movative@users.noreply.github.com"
ENV HUGO_VERSION 0.67.0

    # Get newest version of hugo.
RUN echo "INFO: Installing packages with apk..." \
    && apk add --no-cache \
            libc6-compat \
            curl \
            git \
            npm \
            yarn \
    && echo "INFO: Looking for latest Hugo version..." \
    && export HUGO_VERSION=$(curl --silent 'https://api.github.com/repos/gohugoio/hugo/releases/latest' | grep "tag_name" | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-) \
    && echo "INFO: Hugo latest: $HUGO_VERSION"

RUN echo "INFO: Installing hugo:$HUGO_VERSION" \
    && mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/local/bin/hugo && apk del curl \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo \
    && echo "INFO: Installing npm packages..." \
    && npm install -g postcss-cli autoprefixer \
    && echo "INFO: Finished '$CI_REGISTRY_IMAGE'."
    
WORKDIR /src
