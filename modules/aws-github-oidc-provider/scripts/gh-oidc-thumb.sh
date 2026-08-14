#!/bin/bash


# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html

GITHUB_OIDC_HOST="token.actions.githubusercontent.com"
THUMBPRINT=$(echo \
    | openssl s_client -servername ${GITHUB_OIDC_HOST} -showcerts -connect ${GITHUB_OIDC_HOST}:443 2>&- \
    | tac \
    | sed -n '/-----END CERTIFICATE-----/,/-----BEGIN CERTIFICATE-----/p; /-----BEGIN CERTIFICATE-----/q' \
    | tac \
    | openssl x509 -fingerprint -noout | sed 's/://g' | awk -F= '{print tolower($2)}')

echo "$THUMBPRINT"