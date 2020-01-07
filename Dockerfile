FROM alpine

RUN apk add --update tzdata
ENV TZ=Asia/Shanghai

ENV FRP_VERSION 0.31.1
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frpc \
    && cp frp_${FRP_VERSION}_linux_amd64/frpc* /frpc/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*
    
RUN rm -rf /var/cache/apk/*

RUN mkdir /conf
VOLUME /conf

WORKDIR /frpc
ENTRYPOINT ["./frpc","-c","/conf/frpc.ini"]
