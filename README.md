# Pharo tree-sitter

This is a binding to tree-sitter from Pharo.
It allows one to perform analysis or highlight code using an existing tree sitter parser made by the community

## Installation

You have to install the binding in Pharo **as well as** the tree-sitter dependencies.
The dependencies are:
- The shared library for tree-sitters
- The shared library of the program you wanna parse

```st
Metacello new
  baseline: 'TreeSitter';
  repository: 'github://badetitou/Pharo-Tree-Sitter:main/src';
  load.
```

### Windows

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

## Quick Example

```st
parser := TSParser new.
pythonLanguage := TSLanguage python.
parser language: pythonLanguage.

string := 'print("Hello, I''m Python!") # comment'.

tree := parser parseString: string.

tree rootNode
```
