FROM httpd:alpine

COPY rootfs /

RUN apk add --no-cache ca-certificates && \
    sed -ri \
        -e 's/Listen\ 80/#Listen\ 80/' \
        -e 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' \
        -e 's/#LoadModule\ remoteip_module/LoadModule\ remoteip_module/' \
        -e 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' \
        -e 's/#LoadModule\ ssl_module/LoadModule\ ssl_module/' \
        -e 's/#LoadModule\ proxy_module/LoadModule\ proxy_module/' \
        -e 's/#LoadModule\ mod_proxy_connect/LoadModule\ mod_proxy_connect/' \
        -e 's/#LoadModule\ proxy_http_module/LoadModule\ proxy_http_module/' \
        -e 's/#LoadModule\ substitute_module/LoadModule\ substitute_module/' \
        -e 's/#LoadModule\ expires_module/LoadModule\ expires_module/' \
        -e 's/#LoadModule\ logio_module/LoadModule\ logio_module/' \
        -e 's/CustomLog/#CustomLog/' \
		"/usr/local/apache2/conf/httpd.conf" \
  && echo 'Include conf/docker.conf' >> /usr/local/apache2/conf/httpd.conf
