FROM debian:stretch-slim

RUN set -ex; \
	fetchDeps=" \
		dirmngr \
		gnupg \
	"; \
	apt-get update; \
	apt-get install -y --no-install-recommends procps curl unzip apt-transport-https ca-certificates $fetchDeps; \
	curl -L https://packagecloud.io/varnishcache/varnish41/gpgkey | apt-key add - ; \
	echo deb https://packagecloud.io/varnishcache/varnish41/debian/ stretch main > /etc/apt/sources.list.d/varnish.list; \
	apt-get update; \
	apt-get install -y --no-install-recommends varnish-agent; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
	rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/

ENV AGENT_PORT 6085

ADD https://github.com/brandonwamboldt/varnish-dashboard/archive/master.zip .

RUN unzip master.zip &&\
	mv varnish-dashboard-master varnish-dashboard

WORKDIR /etc/varnish

COPY docker-entrypoint /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD []

EXPOSE 6085

