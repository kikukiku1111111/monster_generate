#!/bin/sh
set -e

rm -f /myapp/tmp/pids/server.pid

if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails assets:precompile
  bundle exec rails db:create
  bundle exec rails db:migrate
fi

exec "$@"

