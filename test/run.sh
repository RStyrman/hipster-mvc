#!/bin/bash

set -e

#####
# Unit Tests

echo "starting test server"
./bin/hop test_server-start

# echo "content_shell --dump-render-tree test/index.html"
# results=`content_shell --dump-render-tree test/index.html 2>&1`

# echo "$results" | grep CONSOLE

# echo "$results" | grep 'unittest-suite-success' >/dev/null

# echo "$results" | grep -v 'Exception: Some tests failed.' >/dev/null

./bin/hop tests-run

./bin/hop test_server-stop
./bin/hop test_database-delete

exit 0

#####
# Type Analysis

echo
echo "dartanalyzer lib/*.dart"

dartanalyzer lib/hipster_collection.dart
if [[ $? != 0 ]]; then
  exit 1
fi

dartanalyzer lib/hipster_events.dart
if [[ $? != 0 ]]; then
  exit 1
fi

dartanalyzer lib/hipster_history.dart
if [[ $? != 0 ]]; then
  exit 1
fi

dartanalyzer lib/hipster_model.dart
if [[ $? != 0 ]]; then
  exit 1
fi

dartanalyzer lib/hipster_router.dart
if [[ $? != 0 ]]; then
  exit 1
fi

dartanalyzer lib/hipster_view.dart
if [[ $? != 0 ]]; then
  exit 1
fi
