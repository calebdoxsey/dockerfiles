FROM alpine:3.12 as builder

ARG EXHALE_VERSION

RUN apk --no-cache add \
    g++ \
    git \
    make

WORKDIR /src/exhale
RUN git clone \
    --branch ${EXHALE_VERSION} \
    --depth 1 \
    https://gitlab.com/ecodis/exhale.git .
RUN make release

FROM alpine:3.12 as runner

RUN apk --no-cache add \
    libstdc++

COPY --from=builder /src/exhale/bin/exhale /usr/local/bin/exhale

ENTRYPOINT ["/usr/local/bin/exhale"]
