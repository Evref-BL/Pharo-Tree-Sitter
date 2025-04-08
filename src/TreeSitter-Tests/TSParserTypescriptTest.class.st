Class {
	#name : 'TSParserTypescriptTest',
	#superclass : 'TestCase',
	#instVars : [
		'parser',
		'typescriptLanguage'
	],
	#category : 'TreeSitter-Tests',
	#package : 'TreeSitter-Tests'
}

{ #category : 'running' }
TSParserTypescriptTest >> setUp [

	super setUp.

	parser := TSParser new.
	typescriptLanguage := TSLanguage typescript.
	parser language: typescriptLanguage .
]

{ #category : 'running' }
TSParserTypescriptTest >> tearDown [

	parser delete.
	super tearDown
]

{ #category : 'tests' }
TSParserTypescriptTest >> testChildrenCollection [

	| string tree |
	string := 'const car: { type: string, model: string, year: number } = {
  					type: "Toyota",
 					model: "Corolla",
  					year: 2009
				};'.

	tree := parser parseString: string. 
	
	self assert: tree rootNode collectNamedChild size equals: 1. 
	self assert: tree rootNode firstNamedChild collectNamedChild size equals: 1.
	self assert: tree rootNode firstNamedChild firstNamedChild collectNamedChild size equals: 3. 
]

{ #category : 'tests' }
TSParserTypescriptTest >> testFieldsNamesCollection [

	| string tree fieldsDict|
	string := 'function deleteUser(user: User) {
  					// This is a comment
				 }'.

	tree := parser parseString: string.
	
	fieldsDict := tree rootNode namedChildren first collectFieldNameOfNamedChild.
	
	self assert: fieldsDict keys first equals: 'name'. 
	self assert: fieldsDict keys second equals: 'parameters'. 
	self assert: fieldsDict keys third equals: 'body'. 
]

{ #category : 'tests' }
TSParserTypescriptTest >> testParseTypescriptClass [

	| string tree |
	string := 'class Person {
  					name: string;
				 }'.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 1.
	self assert: tree rootNode namedChildren first type equals: 'class_declaration'.
	
	
	
]

{ #category : 'tests' }
TSParserTypescriptTest >> testParseTypescriptClassAndExpression [

	| string tree |
	string := 'class Person {
  					name: string;
				 }
				const person = new Person();
				person.name = "Jane"; '.

	tree := parser parseString: string.
	self assert: tree rootNode namedChildCount equals: 3.
	self assert: tree rootNode firstNamedChild type equals: 'class_declaration'.
	self assert: tree rootNode namedChildren second type equals: 'lexical_declaration'.
	self assert: tree rootNode namedChildren third type equals: 'expression_statement'.
	
	
]

{ #category : 'tests' }
TSParserTypescriptTest >> testParseTypescriptFunction [

	| string tree |
	string := 'function deleteUser(user: User) {
  					// This is a comment
				 }'.

	tree := parser parseString: string.
	self assert: tree rootNode childCount equals: 1.
	self assert: tree rootNode firstNamedChild type equals: 'function_declaration'.
	self assert: tree rootNode firstNamedChild namedChildCount equals: 3.
	self assert: tree rootNode firstNamedChild firstNamedChild type equals: 'identifier'.
	self assert: tree rootNode firstNamedChild namedChildren second type equals: 'formal_parameters'.
	self assert: tree rootNode firstNamedChild namedChildren third type equals: 'statement_block'.
]

{ #category : 'tests' }
TSParserTypescriptTest >> testParseTypescriptLong [

	| string tree |
	string := 'import { execSync } from ''node:child_process''
				import { inc } from ''semver''
				import { consola } from ''consola''
				import { determineBumpType, loadWorkspace } from ''./_utils''

				const nightlyPackages = {
  					// nitro: ''nitro-nightly'',
  					// h3: ''h3-nightly'',
  					nuxi: ''nuxi-nightly'',
				}
				async function main () {
  					const workspace = await loadWorkspace(process.cwd())
  					const commit = execSync(''git rev-parse --short HEAD'').toString(''utf-8'').trim().slice(0, 8)
  					const date = Math.round(Date.now() / (1000 * 60))
  					const bumpType = await determineBumpType()
  					for (const pkg of workspace.packages.filter(p => !p.data.private)) {
    					const newVersion = inc(pkg.data.version, bumpType || ''patch'')
    					workspace.setVersion(pkg.data.name, `${newVersion}-${date}.${commit}`, {
      						updateDeps: true,
    					})
    					for (const [name, nightlyName] of Object.entries(nightlyPackages)) {
      						if (pkg.data.dependencies && name in pkg.data.dependencies) {
        						pkg.data.dependencies[name] = `npm:${nightlyName}@latest`
      						}
    					}
    					const newname = pkg.data.name + ''-nightly''
    					workspace.rename(pkg.data.name, newname)
  					}
					await workspace.save()
				}
				main().catch((err) => {
  					consola.error(err)
  					process.exit(1)
				})'.

	tree := parser parseString: string.
	self assert: tree rootNode  isNotNil . 
	self assert: tree rootNode childCount equals: 7.
	self assert: tree rootNode firstNamedChild type equals: 'import_statement'.
	self assert: tree rootNode firstNamedChild namedChildCount equals: 2.
	self assert: tree rootNode firstNamedChild firstNamedChild type equals: 'import_clause'.
	self assert: tree rootNode firstNamedChild namedChildren second type equals: 'string'. 



]
