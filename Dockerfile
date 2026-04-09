FROM alpine:latest

ARG PB_VERSION=0.25.1  # use latest from https://pocketbase.io/docs/

RUN apk add --no-cache unzip ca-certificates \
  && wget -q https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
  && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
  && rm pocketbase_${PB_VERSION}_linux_amd64.zip \
  && chmod +x /pocketbase

# Optional: COPY pb_migrations /pocketbase/pb_migrations
# Optional: COPY pb_hooks /pocketbase/pb_hooks

EXPOSE 8080

CMD ["/pocketbase", "serve", "--http=0.0.0.0:10000", "--dir=/pocketbase/pb_data"]
