#
# This is a library of commonly used functions and variables
#

#
# Parse our command line arguments.
#
function parse_args() {

	if test ! "$1"
	then
		print_syntax
	fi

	INDEX_DIR=$1

	if test ! -d "${INDEX_DIR}"
	then
		echo "! "
		echo "! Directory '${INDEX_DIR}' doesn't exist."
		echo "! "
		exit 1
	fi

} # End of parse_args()


#
# Print our syntax and exit.
#
function print_syntax() {

	echo "! "
	echo "! Syntax: $0 INDEX_DIR"
	echo "! "
	echo "! INDEX_DIR - The directory of our where our Index should be created/searched."
	echo "! "
	exit 1

} # End of print_syntax()


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


