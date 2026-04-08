FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /pb
COPY pocketbase /pb/pocketbase
COPY pb_data /pb/pb_data
EXPOSE 10000
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:10000"]




