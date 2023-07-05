service nginx stop

envsubst <./nginx/config/proxy.conf >./conf.d/default.conf

nginx-debug -g 'daemon off;'
