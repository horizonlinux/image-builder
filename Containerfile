ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY build.sh /tmp/
COPY /build_files/ /tmp/

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    /tmp/base.sh
