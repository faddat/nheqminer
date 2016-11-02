FROM alpine
RUN apk add --update git cmake make gcc g++ libc-dev boost-dev
RUN git clone --recursive https://github.com/kost/nheqminer.git
WORKDIR /nheqminer/nheqminer
RUN mkdir build
WORKDIR /nheqminer/nheqminer/build
RUN cmake -DSTATIC_BUILD=1 -DXENON=2 -DMARCH="-m64" ..
RUN make
ENTRYPOINT ["/nheqminer/nheqminer/build/nheqminer"]