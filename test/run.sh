#!/bin/bash

set -e

results=`DumpRenderTree test/index.html 2>&1`

echo "$results" | grep CONSOLE

echo $results | grep 'unittest-suite-success' >/dev/null

echo $results | grep -v 'Exception: Some tests failed.' >/dev/null
