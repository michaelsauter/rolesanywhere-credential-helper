FROM golang:1.22 AS builder
COPY . /app
RUN cd /app && make release

FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=builder /app/build/bin/aws_signing_helper /usr/bin/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
