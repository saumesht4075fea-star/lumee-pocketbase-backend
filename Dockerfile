    FROM alpine/git:latest as builder
    WORKDIR /app
    COPY . .
    RUN chmod +x pocketbase
    RUN chmod +x start.sh

    FROM alpine:latest
    WORKDIR /app
    COPY --from=builder /app/pocketbase .
    COPY --from=builder /app/start.sh .
    COPY --from=builder /app/pb_data ./pb_data
    COPY --from=builder /app/pb_public ./pb_public

    EXPOSE $PORT

    CMD ["./start.sh"]
