# joomla-download

[![CI](https://github.com/PopArtDesign/joomla-download/actions/workflows/tests.yaml/badge.svg)](https://github.com/PopArtDesign/joomla-download/actions/workflows/tests.yaml)

Bash script to download and extract a specific version of [Joomla](https://joomla.org/).

## Installation

Just download the script to a directory in your `$PATH`. For example:

```sh
wget https://raw.githubusercontent.com/PopArtDesign/joomla-download/refs/heads/main/joomla-download \
    -O ~/.local/bin/joomla-download && chmod +x ~/.local/bin/joomla-download
```

## Usage

Usage: `joomla-download <path> [<version>]`

Arguments:

- `<path>` The directory where Joomla! will be downloaded and extracted.

- `<version>` The specific version of Joomla! to download. Optional.
  If not provided, the latest stable version will be downloaded.
  Supports semantic versioning (e.g., 5.2.1), major.minor (e.g., 4.3), or major (e.g., 3).
  Alternatively, the version can be specified via the `JOOMLA_VERSION` environment variable.

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

## Proxy Support

The `joomla-download` script uses `curl` to fetch Joomla! releases. If you are behind a proxy, `curl` will automatically respect standard proxy environment variables such as `http_proxy`, `https_proxy`, and `no_proxy`. Ensure these variables are correctly configured in your shell environment if you encounter network issues.

## License

Copyright (c) Voronkovich Oleg. Distributed under the [MIT](LICENSE).
