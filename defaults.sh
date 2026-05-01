#!/usr/bin/env bash
export HTTP_LISTEN_PORT=${HTTP_LISTEN_PORT:-10080}
export HTTPS_LISTEN_PORT=${HTTPS_LISTEN_PORT:-10443}
export UUID_VARIABLE_NAME=${UUID_VARIABLE_NAME:='$request_id'}

function get_id_var() {
    LOCATION_ID=$1
    VAR_NAME=$2
    NEW_VAR_NAME="${VAR_NAME}_${LOCATION_ID}"
    if [ "${!NEW_VAR_NAME}" == "" ]; then
        NEW_VAR_NAME=${VAR_NAME}
    fi
    echo ${!NEW_VAR_NAME}
}

function msg() {
    if [ "${LOCATION}" != "" ]; then
        LOC_TXT=${LOCATION_ID}:${LOCATION}:
    fi
    echo "SETUP:${LOC_TXT}$1"
}

function exit_error_msg() {
    echo "ERROR:$1"
    exit 1
}
