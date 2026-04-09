FROM alpine:latest

ARG PB_VERSION=0.25.1

RUN apk add --no-cache unzip ca-certificates \
  && wget -q https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
  && unzip pocketbase_${PB_VERSION}_linux_amd64.zip -d /pb/ \
  && rm pocketbase_${PB_VERSION}_linux_amd64.zip \
  && chmod +x /pb/pocketbase

# Create data and migrations dirs (empty OK)
RUN mkdir -p /pb/pb_data /pb/pb_migrations /pb/pb_hooks

WORKDIR /pb

EXPOSE 10000

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:10000", "--dir=/pb/pb_data", "--log=/pb/pb_data/pb.log"]
