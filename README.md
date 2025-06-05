# joomla-download

Bash script to download and extract a specific version of [Joomla](https://joomla.org/).

## Usage

```
joomla-download <path> [<version>]
```

## Examples

```sh
# Download the latest version
joomla-download ~/projects/joomla

# Download precise version
joomla-download ~/projects/joomla 5.2.1

# Download the latest 4.3.x version (e.g. 4.3.4)
joomla-download ~/projects/joomla 4.3

# Download the latest 3.x version (e.g. 3.10.12)
joomla-download ~/projects/joomla 3

# Use current directory (downloads latest version)
joomla-download .
```
