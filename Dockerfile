FROM ubuntu:16.04

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install < /dev/null > /dev/null 2>&1 \
		curl \
		dialog \
		haproxy \
		nginx \
		supervisor \
	&& rm -fr /var/lib/apt/lists/*

RUN rm -f /etc/haproxy/haproxy.cfg
RUN rm -f /etc/nginx/nginx.conf
RUN rm -f /etc/supervisor/conf.d/supervisord.conf

COPY conf/index.html /usr/share/nginx/html/index.html
COPY conf/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]

