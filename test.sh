#!/bin/bash
#
# Just run through some tests with fake ZIP files
#

# Errors are fatal
set -e

pushd $(dirname $0) > /dev/null

DIR="test-files"

#
# Remove any previous indexes
#
rm -rfv ${DIR}/indexed-files

./zip-create-test-files

./zip-index ${DIR}
#
# Unsure why this second run doesn't skip duplicates when in this script, 
# but works fine in the command line.  I will have to come back to this.
#
./zip-index ${DIR}

./zip-list ${DIR} | head 
./zip-list ${DIR}2 | head


./zip-search ${DIR} 5
./zip-search ${DIR} even



