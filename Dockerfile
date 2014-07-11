FROM centos:latest

RUN yum -y update && yum -y install gcc-c++ tar

RUN mkdir /usr/src/nodejs \
        && curl -SL http://nodejs.org/dist/v0.10.29/node-v0.10.29.tar.gz \ 
                | tar -xzC /usr/src/nodejs --strip-components=1 \
	&& cd /usr/src/nodejs \
	&& ./configure \
	&& make \
	&& make install \
	&& cd .. \
	&& rm nodejs -rf 

ENV PATH $PATH:/usr/local/bin

RUN npm install -g node-gyp

RUN npm install -g docker-tty

ADD . /usr/src/console

ENTRYPOINT ["/usr/src/console/docker-entrypoint.sh"]

EXPOSE 8080 80

CMD ["docker-tty","--config","/usr/src/console/config.json"]

