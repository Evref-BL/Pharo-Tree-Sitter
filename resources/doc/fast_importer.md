# Create a FAST importer with TreeSitter

This section will cover the content of the package `TreeSitter-FAST-Utils` and explain how to use it to create a [FAST model](https://modularmoose.org/users/ast/fast/) for the [`Moose plateform`](https://github.com/moosetechnology/Moose).

> [!NOTE]
> Here is some context for this documentation. It was produced after a new iteration over the FAST importer of TreeSitter and the production of [FAST-Python](https://github.com/moosetechnology/FAST-Python). Multiple utilities got extracted from `FAST-Python` to `pharo-tree-sitter`. This documentation will be explained as if all those utilities were present in `pharo-tree-sitter` before `FAST-Python` was started and most of the examples provided here will be from `FAST-Python`. 

<!-- TOC -->

- [Create a FAST importer with TreeSitter](#create-a-fast-importer-with-treesitter)
  - [Some context](#some-context)
  - [Get a working baisc FAST importer](#get-a-working-baisc-fast-importer)
    - [Install TreeSitter](#install-treesitter)
    - [Generate the base of the Metamodel](#generate-the-base-of-the-metamodel)
    - [Implement the importer](#implement-the-importer)
  - [Customize your metamodel and visitor](#customize-your-metamodel-and-visitor)

<!-- /TOC -->

## Some context

This documentation assume you are already familiar with:

- Tree-Sitter
- Pharo-Tree-Sitter
- FAST
- Metamodel generators

> [!IMPORTANT]
> If you are not, the following provides a general introduction to these tools/libraries along with references for further details:
> - **[Tree-Sitter](https://tree-sitter.github.io/tree-sitter/)** is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. It is able to parse a large variety of programming languages such as Java, C++, C#, Python and many others.
> - **[Pharo-Tree-Sitter](https://github.com/Evref-BL/Pharo-Tree-Sitter/)** the project containing the FAST importer infrastructure. It is developed in Pharo and integrates the original Tree-Sitter parsers and allows visualizing their results (such as ASTs) directly in Pharo. It relies on the FFI protocol, which requires the corresponding libraries depending on the OS (.dll, .so, or .pylib) to be present in Pharo’s VM folders.
> The project supports parsing several languages, and for some of them (like Python, TypeScript, and C), the library generation is automated. You can find more details in the README.
> This is the project that we will use to generate a new FAST-Language metamodel, so you need to download it into your Pharo image.
> - **[FAST](https://github.com/moosetechnology/fast)** means Famix AST. Contrary to Famix that represent application at a high abstraction level, FAST uses a low-level representation: the AST.
> FAST defines a set of traits that can be used to create new meta-models compatible with Moose tools.
> When developing a new FAST-Language metamodel, you will rely on these FAST traits to structure your metamodel.
> - **[Metamodel generator](https://modularmoose.org/developers/create-new-metamodel/)** is a Pharo library used to create new metamodels such as FAST-Java, Famix-Java, or FAST-Fortran.
> The generation of any new version of a FAST-Language metamodel can only be achieved through the metamodel generator.
> As you will see in this post, Pharo-Tree-Sitter enables you to define a new metamodel generator. Once executed, it produces the corresponding FAST-Language metamodel. We will explain this process in more detail in the following sections.


## Get a working baisc FAST importer 

### Install TreeSitter

First you need to create a Moose image and download [Pharo-Tree-Sitter](https://github.com/Evref-BL/Pharo-Tree-Sitter/):

```smalltalk
Metacello new
  baseline: 'TreeSitter';
  repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src';
  load.
```

Once you project will have a baseline, you need to add tree sitter as a dependency:

```smalltalk
spec
	baseline: 'TreeSitter'
	with: [ spec repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src' ]
```

Once downloaded, you need to make sure that `Pharo-Tree-Sitter` is able to parse the language that you intend to create the metamodel for.
If it is not included, you need to follow the instructions in the readme file of this repository and add the new language.
For this documentation we will assume that the language is already supported and we will continue with "Python" 🐍🐍🐍.

To be able to continue, and if this is the first time you're using `pharo-tree-sitter`, you need to launch the tests of python in package `TreeSitter-Tests` class `TSParserPythonTest`.
This is needed to launch the process of downloading the original **[tree-sitter](https://github.com/tree-sitter/tree-sitter)** and **[tree-sitter-python](github.com/tree-sitter/tree-sitter-python)** projects from GitHub, generating the correspondent libraries.

Now that you have the libraries, you can parse python code and get an AST corresponding to the tree-sitter grammar, but not FAST-Python model. The next step will be to generate a basic FAST metamodel for our language.

### Generate the base of the Metamodel

It is possible to generate a first basic version of the FAST model using this the `TSFASTBuilder` like this:

```smalltalk
TSFASTBuilder new
    languageName: 'Python';
    tsLanguage: TSLanguage python;
    build.
```

The language name will be use for the prefix of the class names. They will be on the form of `FASTPrefixSymbol` like `FASTPyFunctionDefinition`.

The tsLanguage is the tree sitter language to use to retrieve the possible symbols.

Once this code is executed, a new FAST generator will be in your image and you can generate the classes with it:

```smalltalk
FASTPythonMetamodelGenerator generate
```

Example of generated code:

![Screenshot of the basic MM](basicMM.png)

In this generated metamodel, only one relation exist between any entities from #`genericChildren` to #`genericParent`. This relation will be used to manage all relations in this basic importer. We will be able to improve this later.

> [!TIP]
> The metamodel generated will be only a base. It will have a class for each element of the syntax but it will habe no hierarchy, no trait usage, no specific relations and no properties. We provide an explanation of the possible customizations in the section: [customize your metamodel and visitor](#customize-your-metamodel-and-visitor).

### Implement the importer

TODO 

## Customize your metamodel and visitor

TODO

