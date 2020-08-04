FROM debian:9-slim

# Expose 8080
# Heroku PORT env var
ENV PORT 8080
EXPOSE 8080

WORKDIR /pangolin
ENTRYPOINT bash /pangolin/start.sh



RUN apt update
RUN apt install -y iproute2 iptables net-tools dos2unix
RUN apt-get install -y \
    git curl build-essential libssl-dev zlib1g-dev
COPY pangolin /pangolin
RUN chmod 777 /pangolin/main
RUN dos2unix /pangolin/start.sh
