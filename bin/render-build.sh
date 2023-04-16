#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

postgres://databasefree_user:YNPnOk0tB2RM1nJodjh3IwUasfHdCWTd@dpg-cf2hk7en6mpkr6eekpog-a/databasefree  DB-URL
c89d53892dcd07df4f0dd57967162560  RAILS_MASTER_KEY