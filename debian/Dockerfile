FROM debian:10 as build

RUN apt update \
&& apt install -y build-essential texinfo python-dev git curl m4

COPY build-bleeding-edge-toolchain.sh .

RUN export TERM=xterm \
&& sh build-bleeding-edge-toolchain.sh --skip-documentation --skip-archive --quiet

FROM debian:10

RUN apt update \
&& apt install -y make

ENV BIN_PATH /bleeding-edge-toolchain

WORKDIR ${BIN_PATH}

ENV PATH "$PATH:${BIN_PATH}/bin"

COPY --from=build installNative .

WORKDIR /build

CMD [ "arm-none-eabi-gcc", "--version" ]