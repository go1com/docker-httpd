FROM httpd:alpine@sha256:ebd56d4733a579fdf156fc5c720a285d27680faea78830bae767c5e215cf28b5

COPY rootfs /

RUN sed -ri \
        -e 's/Listen\ 80/#Listen\ 80/' \
        -e 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' \
        -e 's/#LoadModule\ remoteip_module/LoadModule\ remoteip_module/' \
        -e 's/#LoadModule\ expires_module/LoadModule\ expires_module/' \
        -e 's/#LoadModule\ logio_module/LoadModule\ logio_module/' \
		"/usr/local/apache2/conf/httpd.conf" \
  && echo 'Include conf/docker.conf' >> /usr/local/apache2/conf/httpd.conf
