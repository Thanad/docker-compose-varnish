FROM debian:stretch-slim

ENV VARNISH_SIZE 100M

WORKDIR /etc/varnish

RUN set -ex; \
	fetchDeps=" \
		dirmngr \
		gnupg \
	"; \
	apt-get update; \
	apt-get install -y --no-install-recommends procps curl apt-transport-https ca-certificates $fetchDeps; \
	curl -L https://packagecloud.io/varnishcache/varnish41/gpgkey | apt-key add - ; \
	echo deb https://packagecloud.io/varnishcache/varnish41/debian/ stretch main > /etc/apt/sources.list.d/varnish.list; \
	apt-get update; \
	apt-get install -y --no-install-recommends varnish varnish-agent; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
	rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

EXPOSE 80 8443
CMD []
