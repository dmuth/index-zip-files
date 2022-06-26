#
# This is a library of commonly used functions and variables
#

#
# Main directory for our indexes
# The directory under this one will be specific for what directory was indexed.
#
INDEX_DIR=""

# The string to search for
SEARCH_STRING=""


#
# Parse our command line arguments.
#
function parse_args() {

	if test ! "$1"
	then
		print_syntax
	fi

	SRC_DIR=$1
	SRC_DIR=$(realpath ${SRC_DIR})

	if test ! -d "${SRC_DIR}"
	then
		echo "! "
		echo "! Directory '${SRC_DIR}' doesn't exist."
		echo "! "
		exit 1
	fi

	#
	# Set our Index directory to be under the top-level directory of this app.
	# Note that this file should have been included via a script that had pushd $(dirname $0) in it
	# so that we changed to the directory where these scripts live.
	#
	INDEX_DIR=${PWD}/indexed-files/$(echo $SRC_DIR | sed -e "s|[^a-z0-9]|_|gi")

} # End of parse_args()


#
# Print our syntax and exit.
#
function print_syntax() {

	echo "! "
	echo "! Syntax: $0 SRC_DIR"
	echo "! "
	echo "! SRC_DIR - The directory of our where our Index should be created/searched."
	echo "! "
	exit 1

} # End of print_syntax()


#
# Parse our command line arguments.
#
function parse_args_search() {

	if test ! "$2"
	then
		print_syntax_search
	fi

	SRC_DIR=$1
	SRC_DIR=$(realpath ${SRC_DIR})

	if test ! -d "${SRC_DIR}"
	then
		echo "! "
		echo "! Directory '${SRC_DIR}' doesn't exist."
		echo "! "
		exit 1
	fi

	#
	# Set our Index directory to be under the top-level directory of this app.
	# Note that this file should have been included via a script that had pushd $(dirname $0) in it
	# so that we changed to the directory where these scripts live.
	#
	INDEX_DIR=${PWD}/indexed-files/$(echo $SRC_DIR | sed -e "s|[^a-z0-9]|_|gi")

	SEARCH_STRING=$2

} # End of parse_args_search()


#
# Print our syntax and exit.
#
function print_syntax_search() {

	echo "! "
	echo "! Syntax: $0 SRC_DIR string"
	echo "! "
	echo "! SRC_DIR - The directory of our ZIP files.  This will affect which Index is searched."
	echo "! "
	echo "! string - The string to search for in the filename"
	echo "! "
	echo "! "
	exit 1

} # End of print_syntax_search()


#
# Convert the name of our ZIP file to that of an Index file
#
function zip_filename_to_index_filename() {

	#
	# Convert dashes to underscores, and slashes to dashes.
	# Everything not alphanumeric becomes and underscore as well.
	# Put "-INDEX" on the end.
	# End result is that we should be able to conver this back to a reasonable 
	# fascimilie of the original filename when printing up search results.
	#
	cat \
		| sed -e "s|[-]|_|gi" \
			-e "s|[/]|-|gi" \
			-e "s|[^a-z0-9\-]|_|gi" \
			-e "s|$|-INDEX|"

} # End of zip_filename_to_index_filename()


#
# Convert the name of our Index file into a fascimilie of our original ZIP file name.
# This may not be 100% correct, but should be close enough for human consumption.
#
function index_filename_to_zip_filename() {

	cat \
		| sed -e "s|-|/|g" \
			-e "s|_|.|g" \
			-e "s|/INDEX$||"

} # End of index_filename_to_zip_filename()


