FROM alpine:latest as builder
ARG VERSION
RUN apk add --no-cache curl && mkdir /hugo && curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz -C /hugo

FROM alpine:latest
LABEL maintainer="38313840+movative@users.noreply.github.com"
RUN addgroup -S hugo && adduser -S hugo -G hugo && apk add --no-cache libc6-compat git npm yarn
USER hugo
WORKDIR /home/hugo
COPY --from=builder /hugo /home/hugo
RUN npm install postcss-cli autoprefixer
ENV PATH="$PATH:/home/hugo/"
ENTRYPOINT ["hugo"]
CMD ["help"]