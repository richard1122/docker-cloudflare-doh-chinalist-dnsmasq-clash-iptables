FROM golang:alpine as builder
RUN apk update && \
    apk add git build-base && \
    go get github.com/cloudflare/cloudflared/cmd/cloudflared && \
    go build github.com/cloudflare/cloudflared/cmd/cloudflared

# ===========================
FROM alpine:3.8
COPY --from=builder /go/bin/cloudflared /cloudflared
RUN apk add --update --no-cache ca-certificates && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["/cloudflared"]
EXPOSE 5300
CMD ["proxy-dns", "--port", "5300", "--address", "0.0.0.0" ]
