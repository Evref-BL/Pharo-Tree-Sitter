# Pharo Tree-Sitter

[![CI](https://github.com/Evref-BL/Pharo-Tree-Sitter/actions/workflows/ci.yml/badge.svg)](https://github.com/Evref-BL/Pharo-Tree-Sitter/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/Evref-BL/Pharo-Tree-Sitter/badge.svg?branch=main)](https://coveralls.io/github/Evref-BL/Pharo-Tree-Sitter?branch=main)
[![DOI](https://zenodo.org/badge/843819305.svg)](https://doi.org/10.5281/zenodo.15089053)

This project provides **Pharo bindings to [Tree-sitter](https://tree-sitter.github.io/tree-sitter/)**.  
It allows you to analyze and highlight code using existing Tree-sitter parsers developed by the community.

To install it in **Pharo**, run the following script in a Playground:

```smalltalk
Metacello new
  baseline: 'TreeSitter';
  repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src';
  load.
```

## Native Libraries Required

To function correctly, the following native libraries are required depending on your OS:

- `libtree-sitter.{dll, so, dylib}`: the core Tree-sitter runtime.
- `tree-sitter-<language>.{dll, so, dylib}`: the parser for the desired language.

For example, to use Tree-sitter with Python:

- `libtree-sitter.dylib` (core)
- `tree-sitter-python.dylib` (parser)

You can generate these manually or take advantage of our **automated setup** for some supported languages.

## Automated Library Generation

We automated the generation and installation of libraries for a few selected languages (currently **Python** and **TypeScript**) to simplify the setup across platforms. The generated libraries are copied directly to the appropriate Pharo `vm` folders.

The automation covers:

- [Tree-sitter core](https://github.com/tree-sitter/tree-sitter)
- [tree-sitter-python](https://github.com/tree-sitter/tree-sitter-python)
- [tree-sitter-typescript](https://github.com/tree-sitter/tree-sitter-typescript)

### How It Works

When a new parser or language is requested, the automation:

1. Checks if the required native library exists in the VM folder.
2. If not, looks in the local cloned repository.
3. If the repo isn’t cloned, it clones it.
4. Builds the required library using CMake + Ninja.
5. Copies it to the correct `vm` location.

This ensures libraries are only built when needed.

> **Note:** Automation is only available for a limited set of languages for now.  
> Contributions are welcome! See the `TreeSitter-Libraries` package and create a new subclass like `TreeSitter-NewLanguage`.

### Required Tools for MacOS and Linux

To make sure the automation process works, please ensure the following tools are installed on your system:

| Tool   | Role                              | Check Command         |
|--------|-----------------------------------|------------------------|
| Git    | Repository cloning                | `git --version`        |
| make  | Build configuration               | `make --version`      |

These are mandatory to clone the repos and generate the libraries on these operating systems.
Also this automated process allows the tests on piplines to succeed.

**However**, it turns out that make command for TreeSitter is not supported on windows. 
But do not worry, we found an alternative to make, but you need to make sure that you have the correspondant tools on your machine, so the automation procces can function properly.
Check the below section;

### Required Tools for Windows

To make sure the automation process works, please ensure the following tools are installed on your system:

| Tool   | Role                              | Check Command         |
|--------|-----------------------------------|------------------------|
| Git    | Repository cloning                | `git --version`        |
| CMake  | Build configuration               | `cmake --version`      |
| GCC    | C/C++ compiler                    | `gcc --version`        |
| Ninja  | Build system                      | `ninja --version`      |

If any of these commands fail, install the corresponding tool before continuing.

## Manual Installation

You can also manually install the required libraries and copy them to the appropriate Pharo VM path. Below is an example for macOS.

### macOS

We recommand you to download the tree-sitter core library using HomeBrew.

```sh
brew install tree-sitter
``` 

Then, locate the `libtree-sitter.dylib` under the path `/opt/homebrew/Cellar/tree-sitter/0.x.x/lib/libtree-sitter.dylib`.
Finally, check the possible lib location detected by Pharo using `FFIMacLibraryFinder new paths` in a playground. 
Both the core library and the parser library should be under any of these paths. Please move them there.
For instance, move your `python.dylib` under `/Pharo/vms/110-x64/Pharo.app/Contents/Resources/lib/`
Pay attention !! Make sure that Pharo is closed when you move the libraries specially after modifications on the original project, for example adding a new api. 
Normally on Windows you cannot replace the existing dll (if you already generated it for the first time) unless Pharo is closed. But if you intend to make it on mac for example, you need to close it and reopen it so the new modifications are applied. 

### Building Tree-sitter Shared Library

To build the shared library for tree-sitter, you can follow the following script:

```sh
# assuming git, gcc, cmake, ninja installed via scoop
git clone https://github.com/tree-sitter/tree-sitter
git fetch origin v0.24.3
git checkout v0.24.3
cd tree-sitter
cd lib
mkdir build
cd build
cmake -G Ninja ..
ninja
```

Then move the `libtree-sitter.dll` file under the **VM** folder of Pharo.

### Archlinux

The tree-sitter libs are available in the extra repository.
So you only have to install tree-sitter and the grammar you wanna use with your package manager.

```sh
yay tree-sitter tree-sitter-grammars
```

## Pre-built Libraries (Temporary Solution)

If you face issues building the libraries, you can download pre-built libraries (for Windows and macOS) here:
https://doi.org/10.5281/zenodo.15423234

## Quick Example

Here is a basic usage example in Pharo:
```st
parser := TSParser new.
pythonLanguage := TSLanguage python.
parser language: pythonLanguage.
string := 'print("Hello, I''m Python!") # comment'.
tree := parser parseString: string.
tree rootNode
```
