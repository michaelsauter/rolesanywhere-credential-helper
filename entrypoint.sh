#!/bin/bash
set -eu

CMD=("aws_signing_helper" "serve" "--refresh-signer")

if [ -n "$PORT" ]; then
  CMD+=("--port" "$PORT")
fi

if [ -n "$CERTIFICATE" ]; then
  CMD+=("--certificate" "$CERTIFICATE")
fi

if [ -n "$PRIVATE_KEY" ]; then
  CMD+=("--private-key" "$PRIVATE_KEY")
fi

if [ -n "$TRUST_ANCHOR_ARN" ]; then
  CMD+=("--trust-anchor-arn" "$TRUST_ANCHOR_ARN")
fi

if [ -n "$PROFILE_ARN" ]; then
  CMD+=("--profile-arn" "$PROFILE_ARN")
fi

if [ -n "$ROLE_ARN" ]; then
  CMD+=("--role-arn" "$ROLE_ARN")
fi

if [ -n "$ENDPOINT" ]; then
  CMD+=("--endpoint" "$ENDPOINT")
fi

if [ -n "$REGION" ]; then
  CMD+=("--region" "$REGION")
fi

if [ -n "$DEBUG" ]; then
  CMD+=("--debug")
fi

"${CMD[@]}"
