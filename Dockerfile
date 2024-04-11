ARG builder_image=golang:1.22
FROM ${builder_image} AS builder
COPY . /app
RUN cd /app && make release

FROM cgr.dev/chainguard/bash
COPY --from=builder /app/build/bin/aws_signing_helper /usr/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
