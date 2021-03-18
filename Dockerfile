FROM golang:alpine as builder
RUN apk update && apk add --no-cache git build-base make tzdata
ENV FRP_VERSION 0.36.1
RUN git clone --branch v${FRP_VERSION} https://github.com/fatedier/frp.git
WORKDIR /go/frp
RUN make frpc

FROM alpine:latest
RUN apk update && apk add --no-cache ca-certificates tzdata
COPY --from=builder /go/frp/bin/frpc /frpc/
ENV TZ=Asia/Shanghai
RUN mkdir /conf
VOLUME /conf
WORKDIR /frpc
ENTRYPOINT ["./frpc","-c","/conf/frpc.ini"]
