#!/bin/sh
set -eux

if [ -n "${INPUT_DEPLOY_USERNAME:-}" ] ; then
    # shellcheck disable=SC2034
    export LEKTOR_DEPLOY_USERNAME="$INPUT_DEPLOY_USERNAME"
fi

if [ -n "${INPUT_DEPLOY_PASSWORD:-}" ] ; then
    # shellcheck disable=SC2034
    export LEKTOR_DEPLOY_PASSWORD="$INPUT_DEPLOY_PASSWORD"
fi

if [ -n "${INPUT_MAKEARG:-}" ] ; then
    # shellcheck disable=SC2086
    exec make $INPUT_MAKEARG
else
    exec "$@"
fi
