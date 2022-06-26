#!/bin/bash
#
# Just run through some tests with fake ZIP files
#

# Errors are fatal
set -e

pushd $(dirname $0) > /dev/null

DIR="test-files"

./zip-create-test-files

./zip-index ${DIR}

./zip-list ${DIR} | head 
./zip-list ${DIR}2 | head


./zip-search ${DIR} 5
./zip-search ${DIR} even



