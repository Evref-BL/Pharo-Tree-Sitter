# Pharo tree-sitter

[![CI](https://github.com/Evref-BL/Pharo-Tree-Sitter/actions/workflows/ci.yml/badge.svg)](https://github.com/Evref-BL/Pharo-Tree-Sitter/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/Evref-BL/Pharo-Tree-Sitter/badge.svg?branch=main)](https://coveralls.io/github/Evref-BL/Pharo-Tree-Sitter?branch=main)
[![DOI](https://zenodo.org/badge/843819305.svg)](https://doi.org/10.5281/zenodo.15089053)



This is a binding to tree-sitter from Pharo.
It allows one to perform analysis or highlight code using an existing tree sitter parser made by the community

## Installation

You have to install the binding in Pharo **as well as** the tree-sitter dependencies.
The dependencies are:
- The shared core library tree-sitters (e.g. _libtree-sitter.dylib_)
- The shared parser library of the language, built using tree-sitter CLI (e.g. _python.dylib_). [tree-sitter tutorial here](https://tree-sitter.github.io/tree-sitter/creating-parsers)

  
```st
Metacello new
  baseline: 'TreeSitter';
  repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src';
  load.
```

### MacOS
We recommand you to download the tree-sitter core library using HomeBrew 

```sh
brew install tree-sitter
``` 

Then, locate the `libtree-sitter.dylib` under the path `/opt/homebrew/Cellar/tree-sitter/0.x.x/lib/libtree-sitter.dylib`

Finally, check the possible lib location detected by Pharo using `FFIMacLibraryFinder new paths` in a playground. Both the core library and the parser library should be under any of these paths. Please move them their.

For instance, move your `python.dylib` under `/Pharo/vms/110-x64/Pharo.app/Contents/Resources/lib/`

### Windows

If you find issues in generating the libraries, you can find them [here for Windows](https://doi.org/10.5281/zenodo.15148695). This is a temporary solution until creating another one to dowload libraries automatically once this project is loaded locally.

#### Tree-Sitter Shared library

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

## Debug

You might want to debug a tree sitter parser from Pharo.
Whereas we did not find _yet_ a way to use the pharo debugger.
You can create a logger attached to the parser.

```st
callback := (TSLogCallback on: [ :payload :log_type :buffer | Transcript crShow: buffer  ] ).
logger := TSLogger new log: callback .
parser logger: logger.
```

## Quick Example

```st
parser := TSParser new.
pythonLanguage := TSLanguage python.
parser language: pythonLanguage.

string := 'print("Hello, I''m Python!") # comment'.

tree := parser parseString: string.

tree rootNode
```
