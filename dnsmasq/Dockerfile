FROM alpine:3.8 as builder

ENV CDL_URL https://github.com/felixonmars/dnsmasq-china-list/archive/master.tar.gz
ENV CDL_FILE chinalist.tar.gz
ENV CHINA_DNS_SERVER 114.114.115.115

WORKDIR /chinalist
ADD ${CDL_URL} ${CDL_FILE}
RUN tar zxvf ${CDL_FILE} --strip 1 \
    && sed -e "s/114.114.114.114/$CHINA_DNS_SERVER/g" accelerated-domains.china.conf > /chinadns.conf

# ============================
FROM alpine:3.8
COPY --from=builder /chinadns.conf /etc/dnsmasq/
ADD entrypoint.sh /entrypoint.sh
EXPOSE 53
RUN  apk add --no-cache dnsmasq && \
    rm -rf /var/cache/apk/*
ENTRYPOINT [ "/entrypoint.sh" ]
