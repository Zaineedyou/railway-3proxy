FROM 3proxy/3proxy:latest

# Copy custom entrypoint that generates config from env vars
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3128 1080

ENTRYPOINT ["/entrypoint.sh"]
