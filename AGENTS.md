# Joomla Download

This project provides a Bash script to download and extract a specific version of [Joomla](https://joomla.org/).

## Project Overview

The primary component is the `joomla-download` script. It's a standalone Bash script that uses `curl` to fetch a specified Joomla version and `tar` to extract it. The script can download the latest version, or a specific major, minor, or patch version.

## Usage

To use the script, you need to provide a path to a directory where Joomla will be downloaded and extracted. You can also provide an optional version number.

### Examples

Download the latest version:
```sh
./joomla-download ~/projects/joomla
```

Download a precise version:
```sh
./joomla-download ~/projects/joomla 5.2.1
```

Download the latest 4.3.x version:
```sh
./joomla-download ~/projects/joomla 4.3
```

## Development

The script is written in Bash and follows the [Google Shell Style Guide](https://google.github.io/styleguide/shell.xml).

### Testing

The project uses [ShellSpec](https://shellspec.info/) for testing.

To run the tests, you need to have ShellSpec installed:

```sh
shellspec
```
