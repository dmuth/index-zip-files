
# Index ZIP Files

What this does: Imagine you have hundreds of ZIP files and you want to find a specific file in one of them, without unzipping each file.  This makes that possible.

What this does not do: This does not index the content of each ZIP file.


## Usage

Clone this repo, then run the various scripts like this:

- `./zip-index SOURCE_DIR`
- `./zip-list SOURCE_DIR`
- `./zip-search SOURCE_DIR string`

This is built to be fast, so no filename sorting is done at any point.  If you want sorting, pipe into the `sort` command. :-)

If you would like to be able to run this app from anywhere in your filesystem, you'll want to...


### Creating Aliases

Running `./zip-aliases SOURCE_DIR ALIAS_KEY` will emit a series of aliases that can be used to index, list, and search ZIP files.

Example: 

```
./zip-aliases ~/Dropbox/ dropbox
# 
# Generating aliases tied to this installation and source directory
# 
# Source Directory: /Users/doug/Dropbox
# Alias Key: dropbox
# 
alias zip-index-dropbox="/Users/doug/development/index-zip-files/zip-index /Users/doug/Dropbox"
alias zip-list-dropbox="/Users/doug/development/index-zip-files/zip-list /Users/doug/Dropbox"
alias zip-search-dropbox="/Users/doug/development/index-zip-files/zip-search /Users/doug/Dropbox"
```

Once you paste those three alias lines in shell, typing `zip-index-dropbox` from any directory will index your Dropbox folder's ZIP files, and `zip-search-dropbox` can be used to search it.  And yes, aliases autocomplete in bash. :-)


## Terminology

- ZIP File: A compressed archive containing 1 or more files.
- Index directory: A directory under `indexed-files/` which containes index files for a specific Source directory.
- Index file: A plaintext file containing filenames of a single ZIP file.


## Testing and Development

- Running `./test.sh` will run `zip-create-test-files` to build a sample directory structure containing ZIP files and then 


## Get in touch

I'm a software engineer based out of Philadelphia, PA.  You can find me on [Twitter](https://twitter.com/dmuth), [Facebook](https://facebook.com/dmuth) and [on my blog](https://www.dmuth.org/).  Feel free to drop by and say hi!



