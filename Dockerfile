FROM golang:alpine
RUN go version

# Expose 8080
# Heroku PORT env var
ENV PORT 8080
EXPOSE 8080

WORKDIR /pangolin
ENTRYPOINT bash /pangolin/start.sh



RUN apt update
RUN apt install -y iproute2 iptables net-tools dos2unix
COPY pangolin /pangolin
RUN chmod 777 /pangolin/main
RUN dos2unix /pangolin/start.sh
