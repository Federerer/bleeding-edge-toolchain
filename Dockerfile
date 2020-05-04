FROM alpine:3.11 as build

RUN apk update \
&& apk add make g++ python-dev git curl coreutils m4 ncurses texinfo

COPY build-bleeding-edge-toolchain.sh .

RUN export TERM=xterm \
&& sh build-bleeding-edge-toolchain.sh --skip-documentation --skip-archive --quiet

FROM alpine:3.11 as prod

WORKDIR /home/dev

COPY --from=build installNative .

ENV PATH $PATH:bin

CMD [ "arm-none-eabi-gcc", "--version" ]