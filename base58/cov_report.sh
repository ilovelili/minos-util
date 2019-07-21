#!/bin/sh

# This script uses gocov to generate a test coverage report.
# The gocov tool my be obtained with the following command:
#   go get github.com/axw/gocov/gocov
#
# It will be installed to $GOPATH/bin, so ensure that location is in your $PATH.

# Check for gocov.
type gocov >/dev/null 2>&1 # https://qiita.com/ritukiii/items/b3d91e97b71ecd41d4ea
if [ $? -ne 0 ]; then # http://linuxcommand.org/lc3_wss0140.php
	echo >&2 "This script requires the gocov tool."
	echo >&2 "You may obtain it with the following command:"
	echo >&2 "go get github.com/axw/gocov/gocov"
	exit 1
fi
gocov test | gocov report
