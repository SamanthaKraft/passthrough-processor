FROM alpine:3.20

WORKDIR /app

RUN mkdir -p /data/input /data/output

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
