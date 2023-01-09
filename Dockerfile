# installing zig on ubuntu/debian is only supported via snap, which cannot be ran from within docker
# make sure to check out .env to set all the paths
FROM archlinux:latest

# installing basic build tools and zig
RUN echo "installing basic build tools" && pacman -Syu --noconfirm cmake make python3 zig

COPY ./scripts/build.sh /build.sh
WORKDIR /zig
ENTRYPOINT ["/build.sh"]
