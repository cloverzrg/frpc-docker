# frpc-docker

### EXAMPLE
`docker run -d --net=host --restart=always -v /var/docker/frpc/conf:/conf cloverzrg/frpc-docker`

`vi /var/docker/frpc/conf/frpc.ini`
```
[common]
server_addr = xxx.xxx.xxx.xxx
server_port = 7000
token = your_token


[home-ssh]
type = tcp
local_port = 22
remote_port = 5022
```
