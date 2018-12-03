FROM dreamacro/clash
ADD https://github.com/tianon/gosu/releases/download/1.11/gosu-amd64 /gosu
RUN chmod 555 /gosu && \
    mkdir -p /.config/clash && \
    mv /root/.config/clash/Country.mmdb /.config/clash/Country.mmdb && \
    chmod 777 -R /.config/
ENTRYPOINT ["/gosu"]
CMD ["900:900", "/clash"]