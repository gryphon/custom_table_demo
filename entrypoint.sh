#!/bin/bash

set -e

rm -f /custom_table_demo/tmp/pids/server.pid

# If running the rails server then create or migrate existing database
if [ "${1}" == "./bin/rails" ] && [ "${2}" == "server" ]; then
  ./bin/rails db:prepare
fi

exec "${@}"
