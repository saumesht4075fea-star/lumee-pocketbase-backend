FROM ubuntu:22.04
WORKDIR /pb
COPY pocketbase /pb/pocketbase
COPY pb_data /pb/pb_data
RUN chmod +x /pb/pocketbase
EXPOSE 10000
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:10000"]
