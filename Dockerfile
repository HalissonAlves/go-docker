FROM golang:1.23.1 as builder

WORKDIR /usr/src/app

COPY hello.go .

RUN go mod init hello && \
  go mod tidy && \
  go build .

FROM scratch
WORKDIR /var/www
COPY --from=builder /usr/src/app .

ENTRYPOINT [ "./hello" ]
