FROM nginx:1.13.7

LABEL Maintainer="Valentin Delaye jonesbusy@gmail.com" ImageName="jonesbusy/nginx-ssl-rp" Version="latest"

ENV backend_host= backend_port= server_host= ssl_server_certificate= ssl_server_key=

RUN apt-get update -y \ 
	&& apt-get install -y gettext \	
	&& rm -rf /var/lib/apt/lists/*

# Add files
ADD ["files/nginx.custom.conf", "/tmp"]
ADD ["files/entrypoint.sh", "/entrypoint.sh"]

ENTRYPOINT /entrypoint.sh

