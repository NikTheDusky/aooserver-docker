# syntax=docker/dockerfile:1
FROM debian:stable AS build
WORKDIR /src
RUN <<EOF
apt-get update
apt-get install -y build-essential libcurl4-openssl-dev
EOF
ADD https://github.com/essej/aooserver.git /src/
WORKDIR /src/Builds/LinuxMakefile
RUN <<EOF
CONFIG=Release make -j$(nproc)
strip build/aooserver
EOF

FROM debian:stable-slim
COPY --from=build --chmod=+x /src/Builds/LinuxMakefile/build/aooserver /bin/aooserver
RUN <<EOF
apt-get update
apt-get install -y curl
EOF
EXPOSE 10998/tcp
EXPOSE 10998/udp
CMD ["/bin/aooserver"]
