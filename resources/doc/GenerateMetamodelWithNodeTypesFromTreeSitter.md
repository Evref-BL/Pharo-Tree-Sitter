## How to Test

Follow the step-by-step guide below to test the dynamic FAST metamodel generation, code parsing, and test generation in a fresh **Pharo image**.

---

### Prerequisites & Dependencies Installation

#### 1. Install `Pharo-Tree-Sitter`
Execute the following Metacello script to load the updated Pharo Tree-Sitter repository:

```smalltalk
Metacello new
    baseline: 'TreeSitter';
    repository: 'github://Evref-BL/Pharo-Tree-Sitter:main/src';
    load.
```

#### 2. Load Package Utilities & Language Bindings
- Load the **`TreeSitter-FAST-Utils`** package using the Iceberg / Pharo Repositories browser.
- Ensure the tree-sitter binding for the target language (e.g., TypeScript) is installed and accessible via `TSLanguage`.
- Ensure the TreeSitter tests for that specific language are passing.

#### 3. Install the FAST Framework
Load the latest FAST framework:

```smalltalk
Metacello new
    baseline: 'FAST';
    repository: 'github://moosetechnology/FAST:v3/src';
    load.
```

---

### Metamodel & Model Generation

#### 4. Generate the Metamodel Generator Class from `node-types.json`

> [!TIP]
> **Where and how to find `node-types.json`:**
> The `node-types.json` file contains the grammar schema (types, fields, and children) for any Tree-Sitter grammar.
> - **Location:** Head to the target language repository on GitHub (typically under `src/`, or `<subfolder>/src/` for multi-grammar repos like TypeScript/TSX).
> - **Usage:** Always click the **Raw** button to get the direct raw URL (e.g. `https://raw.githubusercontent.com/tree-sitter/tree-sitter-typescript/master/typescript/src/node-types.json`) so Pharo can fetch it directly.

Run this script:

```smalltalk
| builder generatorClass |

builder := TSFASTBuilder new.
builder languageName: 'TypeScript'.
builder tsLanguage: TSLanguage typescript. 

"URL to the official Tree-Sitter TypeScript node-types.json schema"
builder nodeTypesJsonUrl: 'https://raw.githubusercontent.com/tree-sitter/tree-sitter-typescript/master/typescript/src/node-types.json'.

generatorClass := builder build.
```

#### 5. Generate the FAST Metamodel
Execute the newly generated metamodel generator to create all FAST classes, traits, and relations:

```smalltalk
FASTTypeScriptMetamodelGenerator new generate.
```

---

### Verification & Test Suite Generation

#### 6. Test AST Parsing
Parse a TypeScript sample snippet using the generated importer to verify proper AST node instantiation:

```smalltalk
FASTTypeScriptImporter parse: 'if (x > 0 ) { console.log("hello") } else { console.log("word") }'.
```

#### 7. Generate Unit Tests

##### a. Create the Test Class Definition
Create a new test class subclassing `TSFASTAbstractImporterTest`:

```smalltalk
TSFASTAbstractImporterTest << #FASTTypeScriptImporterTest
    slots: {};
    package: 'FAST-TypeScript-TestsGenerated'
```

##### b. Generate a Unit Test from a Specific Code Snippet
Generate a single test method dynamically from a snippet:

```smalltalk
| code |
code := 'if ( foo ) { set[ 1 ].apply(); } else { console.log("hello"); }'.

FASTTypeScriptImporterTest 
    generateTestNamed: 'ParsingIfStatement' 
    fromCode: code 
    protocol: 'tests'.
```

##### c. Generate Tests from Tree-Sitter Corpus
> [!TIP]
> **Where and how to find Tree-Sitter corpus test files:**
> Tree-Sitter repositories include official test corpus files containing paired code snippets and expected AST syntax trees.
> - **Location:** In the grammar's GitHub repository, check the `test/corpus/` directory (or `<subfolder>/test/corpus/` for multi-grammar repositories). Files usually end in `.txt`.
> - **Usage:** Select any topic file (e.g., `expressions.txt`, `statements.txt`, `functions.txt`) and click the **Raw** button to copy its direct URL (e.g. `https://raw.githubusercontent.com/tree-sitter/tree-sitter-typescript/master/test/corpus/functions.txt`).

Fetch official Tree-Sitter test corpus files and generate full test suites automatically:

```smalltalk
| corpus |
corpus := TSFASTImporterTestGenerator new 
    getTestCorpusFrom: 'https://raw.githubusercontent.com/tree-sitter/tree-sitter-typescript/refs/heads/master/test/corpus/functions.txt'.

corpus keysAndValuesDo: [ :name :code |
    FASTTypeScriptImporterTest 
        generateTestNamed: 'generated' , name capitalized 
        fromCode: code , ';' 
        protocol: 'tests'
].
```

---

### Expected Results
- **Metamodel Generation**: `FASTTypeScriptMetamodelGenerator` is created with classes, relations, traits, and inheritance matching `node-types.json`.
- **Parsing**: `FASTTypeScriptImporter parse:` returns a valid FAST AST without missing node errors.
- **Tests**: `FASTTypeScriptImporterTest` contains generated test methods that compile and pass in the Test Runner.
