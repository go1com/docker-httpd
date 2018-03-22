FROM httpd:alpine

COPY rootfs /

RUN sed -ri \
        -e 's/Listen\ 80/#Listen\ 80/' \
        -e 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' \
        -e 's/#LoadModule\ remoteip_module/LoadModule\ remoteip_module/' \
        -e 's/#LoadModule\ expires_module/LoadModule\ expires_module/' \
        -e 's/#LoadModule\ logio_module/LoadModule\ logio_module/' \
        -e 's/CustomLog/#CustomLog/' \
		"/usr/local/apache2/conf/httpd.conf" \
  && echo 'Include conf/docker.conf' >> /usr/local/apache2/conf/httpd.conf
