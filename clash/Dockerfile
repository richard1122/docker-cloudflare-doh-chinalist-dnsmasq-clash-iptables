FROM dreamacro/clash
RUN addgroup -g 900 -S appuser && \
    adduser -u 900 -G appuser -S appuser && \
    mkdir -p /home/appuser/.config/clash && \
    mv /root/.config/clash/Country.mmdb /home/appuser/.config/clash/Country.mmdb
USER appuser
