# joomla-download

Bash script to download and extract a specific version of [Joomla](https://joomla.org/).

## Installation

Just download the script to a directory in your `$PATH`. For example:

```sh
wget https://raw.githubusercontent.com/PopArtDesign/joomla-download/refs/heads/main/joomla-download \
    -O ~/.local/bin/joomla-download && chmod +x ~/.local/bin/joomla-download
```

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

## License

Copyright (c) Voronkovich Oleg. Distributed under the [MIT](LICENSE).
