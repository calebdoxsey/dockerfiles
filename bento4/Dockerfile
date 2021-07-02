FROM alpine:3.12 as builder

ARG BENTO4_VERSION

RUN apk --no-cache add \
    binutils \
    cmake \
    gcc \
    g++ \
    git \
    make \
    musl-dev

WORKDIR /src
RUN git clone \
    --branch ${BENTO4_VERSION} \
    --depth 1 \
    https://github.com/axiomatic-systems/Bento4 .
RUN mkdir cmakebuild && cd cmakebuild && cmake -DCMAKE_BUILD_TYPE=Release .. && make

FROM alpine:3.12 as runner

RUN apk --no-cache add \
    ca-certificates \
    bash \
    libstdc++

COPY --from=builder /src/cmakebuild/mp4* /usr/local/bin/

CMD ["bash"]
