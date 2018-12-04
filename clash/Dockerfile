FROM dreamacro/clash
ADD https://github.com/tianon/gosu/releases/download/1.11/gosu-amd64 /gosu
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod 555 /gosu && \
    mkdir -p /.config/clash && \
    mv /root/.config/clash/Country.mmdb /.config/clash/Country.mmdb && \
    chmod 777 -R /.config/ && \
    apk add --no-cache --update iptables \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/gosu", "900:900", "/clash"]
