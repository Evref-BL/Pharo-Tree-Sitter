# Create a FAST importer with TreeSitter

This section covers the content of the package `TreeSitter-FAST-Utils` and explain how to use it to create a [FAST model](https://modularmoose.org/users/ast/fast/) for the [`Moose plateform`](https://github.com/moosetechnology/Moose).

> [!NOTE]
> Here is some context for this documentation: It was produced after a new iteration over the FAST importer of TreeSitter and the production of [FAST-Python](https://github.com/moosetechnology/FAST-Python). Multiple utilities got extracted from `FAST-Python` to `pharo-tree-sitter`. This documentation explains as if all those utilities were present in `pharo-tree-sitter` before `FAST-Python` was started and most of the examples provided here will be from `FAST-Python`. 

<!-- TOC -->

- [Create a FAST importer with TreeSitter](#create-a-fast-importer-with-treesitter)
  - [Some context](#some-context)
  - [Get a working baisc FAST importer](#get-a-working-baisc-fast-importer)
    - [Install TreeSitter](#install-treesitter)
    - [Generate the base of the Metamodel](#generate-the-base-of-the-metamodel)
    - [Implement the importer](#implement-the-importer)
  - [Customize your metamodel and visitor](#customize-your-metamodel-and-visitor)
    - [Improve relations management](#improve-relations-management)
    - [Implement a specialized visitor](#implement-a-specialized-visitor)
  - [Add regression tests to your project](#add-regression-tests-to-your-project)
  - [Cyril's tips on how to work](#cyrils-tips-on-how-to-work)

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

Once you project has a baseline, you need to add tree sitter as a dependency:

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

The language name is used for the prefix of the class names. They are on the form of `FASTPrefixSymbol` like `FASTPyFunctionDefinition`.

The tsLanguage is the tree sitter language to use to retrieve the possible symbols.

Once this code is executed, a new FAST generator will be in your image and you can generate the classes with it:

```smalltalk
FASTPythonMetamodelGenerator generate
```

Example of generated code:

![Screenshot of the basic MM](basicMM.png)

In this generated metamodel, only one relation exist between any entities from #`genericChildren` to #`genericParent`. This relation is used to manage all relations in this basic importer. We will be able to improve this later.

> [!TIP]
> The metamodel generated is only a base. It has a class for each element of the syntax but it has no hierarchy, no trait usage, no specific relations and no properties. We provide an explanation of the possible customizations in the section: [customize your metamodel and visitor](#customize-your-metamodel-and-visitor).

### Implement the importer

Now that we have a basic metamodel, we can import a FAST model like this:

```Smalltalk
| parser tsLanguage importer |

parser := TSParser new.
tsLanguage := TSLanguage python.
parser language: tsLanguage.
string := 'if x > 0:
    if x < 10:
        1
    else:
        2
else:
    3'.

importer := TSFASTImporter new.
importer tsLanguage: tsLanguage.
importer languageName: 'Python'.
importer originString: string.

^ importer import: (parser parseString: string) rootNode
```

This is not really practical so it is recommended to implement a subclass of `TSFASTAbsractImporter`.

For example for Python:

```Smalltalk
TSFASTAbstractImporter << #FASTPythonImporter
	slots: {};
	package: 'FAST-Python-Tools'
```

Once we have this class, we just need to implement the method `tsLanguage` to make it work. 

```Smalltalk
FASTPythonImporter>>tsLanguage

	^ TSLanguage python
```

And the previous script can now be replaced by:

```Smalltalk
FASTPythonImporter parse: 'if x > 0:
    if x < 10:
        1
    else:
        2
else:
    3'
```

or: 

```Smalltalk
FASTPythonImporter parseFile: 'myFile.py'
```

## Customize your metamodel and visitor

> [!WARNING]
This documentation expects the reader to know how to develop a Moose metamodel generator. If this is not the case, you will need to learn how to handle entities hirerachy, relations between entities, properties declaration and hanlding of traits in order to fully understant this section. [See documentation.](https://modularmoose.org/developers/create-new-metamodel/)

We are now able to have a FAST model, but this models has multiple limitations such has:
- There is no management of inheritance and usage of traits in FAST entities
- The relations are all stored in #`genericChildren` and #`genericParent` relation
- There is no property
- The AST of the tree-sitter grammar does not necessarily make a good AST and some nodes could gain to be customized

In some cases, the model produce can be enough. This project was originally done in order to do pattern matching and have a good AST is not necessary. But, in order to use most Moose's tooling, we need to improve the generated code. 

Thus, this project provides a set a tools to customize our Metamodel and Importer.

### Improve relations management

A first way to improve the model is to improve the FAST generator and use specific relations instead of the generic one we generated.

In order to create a FAST model, the importer will first use tree sitter to obtain a `TSTree`. This tree represent the AST of the source code parsed. We then visit its nodes to generate the FAST model.

The `TSNodes` of the tree are grouping their children by `fields`.

For example, we can see on the result of a tool we will explain later in the documentation:

![Inspector](TSSymbolsBuilderVisitor.png)

Here we see `if_statement` nodes have 4 fields:
- `condition` that always have 1 child
- `consequence` that always have 1 child
- `alternative` that is optional and can have multiple children
- an unnamed field that is optional and can have multiple children

If the name a field matches the name of a Fame property (in the Moose description), then this relation will be used.

In the case of our `if_statement`, the FAST node representing it should use `FASTTWithCondition` and store the condition expression into the `condition` relation.

If order to do this, we need to retrieve `FASTTWithCondition` in our generator and make the `ifStatment` use it.

```Smalltalk
FASTPythonMetamodelGenerator>>defineTraits

    super defineTraits.

    tWithCondition := self remoteTrait: #TWithCondition withPrefix: #FAST
```

```Smalltalk
FASTPythonMetamodelGenerator>>defineHierarchy

    super defineHierarchy.

    ifStatment --|> tWithCondition
```

> [!TIP]
> Do not forget to regenerate your metamodel afterward by executing `FASTPythonMetamodelGenerator generate`

> [!NOTE]
> The importer will check if the relation used is multivalued or not. In case it is monovalue, it will use the setter. If it is multivalued, it will use `#addRelationName:`.

This method is good because we just need to improve the metamodel generator to make it work. But it has its limits:
- Some fields are unnamed and cannot be mapped directly to a fame relation
- Some fileds are good names for a basic AST, but not good in an AST specialized for software analysis such as in Moose. For example, the left side of an asssignment can be named `left` in tree sitter, but should be named `variable` in a FAST model. Or a field can be named `expression` in tree sitter because it can contain one or multiple expression. But in Moose, a multivalued relation should be plurial and we need the relation to be named `expressions`.

In order to make further improvements, we can use `TSFASTCustomizableVisitor`.

### Implement a specialized visitor

TODO

## Add regression tests to your project

TODO

## Cyril's tips on how to work

TODO



More:
- Error handling
- Error node
- Utilities