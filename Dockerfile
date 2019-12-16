#
#	Base image
#	@see https://github.com/SloCompTech/docker-baseimage	
#
FROM slocomptech/bi-nginx:1.16.1

#
#	Arguments
#
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_SRC
ARG VERSION

#
#	Labels
#	@see https://github.com/opencontainers/image-spec/blob/master/annotations.md
#	@see https://semver.org/
#
LABEL maintainer="martin.dagarin@gmail.com" \
			org.opencontainers.image.authors="Martin Dagarin" \
			org.opencontainers.image.created=${BUILD_DATE} \
			org.opencontainers.image.description="nginx" \
			org.opencontainers.image.documentation="https://github.com/SloCompTech/docker-nginx" \
			org.opencontainers.image.revision=${VCS_REF} \
			org.opencontainers.image.source=${VCS_SRC} \
			org.opencontainers.image.title="nginx" \
			org.opencontainers.image.url="https://github.com/SloCompTech/docker-nginx" \
			org.opencontainers.image.version=${VERSION}

#
#	Add local files to image
#
COPY root/ /

#
# Move nginx webroot into /app
# Move config into /config
#
RUN cp -r /etc/nginx/* /defaults && \
	sed -i 's/\/usr\/share\/nginx\/html/\/app/g' /defaults/conf.d/default.conf && \
	sed -i 's/\/etc\/nginx/\/config/g' /defaults/nginx.conf && \
	sed -i 's/\/var\/run/\/tmp/g' /defaults/nginx.conf && \
    sed -i 's/\s*#error_page  404.*/    error_page 404 =200 index.html index.htm/' /defaults/conf.d/default.conf

