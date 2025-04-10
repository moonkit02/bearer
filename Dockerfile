FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends git ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY bearer /usr/local/bin/bearer

RUN mkdir /Target

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN git config --global --add safe.directory '*'

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["scan", "/Target"]
