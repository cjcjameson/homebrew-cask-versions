#!/usr/bin/env bash
#
# script.sh
#
# This file is meant to be sourced during the `script` phase of the Travis
# build. Do not attempt to source or run it locally.
#
# shellcheck disable=SC1090
. "${TRAVIS_BUILD_DIR}/ci/travis/helpers.sh"

enter_build_step

header 'Running script.sh...'

if any_casks_modified; then
  modified_casks=($(modified_cask_files))
  run brew cask style "${modified_casks[@]}"
fi

run bundle exec rake test

exit_build_step