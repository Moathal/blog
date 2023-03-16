#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

postgres://databasefree_user:YNPnOk0tB2RM1nJodjh3IwUasfHdCWTd@dpg-cf2hk7en6mpkr6eekpog-a/databasefree  DB-URL
c89d53892dcd07df4f0dd57967162560  RAILS_MASTER_KEY