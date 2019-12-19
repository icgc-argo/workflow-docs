
 ## About the repository
 This repository contains two parts: swagger json merge tool and a node application that serves WES api.
 
 `merge.js` and `diff.js` combined is a simple tool to shallow-merge two or more swagger 2.0 specs into one.

```
node merge.js <baseSpec> [specs...]

Positionals:
  baseSpec  Base spec URL                                               [string]
  specs     List of spec URLs to merge                                  [string]

Options:
  --help        Show help                                              [boolean]
  --version     Show version number                                    [boolean]
  --output, -o  Output filename, by default stdout will be used         [string]
```

Examples:
* combine 3 specs:

```
node merge.js -o merged.json WES-swagger-template.json http://wf-search.light.overture.bio/v2/api-docs http://wf-management.light.overture.bio/v2/api-docs
    
```
* `WES-swagger-template.json` is a pre-defined json template for WES api.
* The tool outputs a merged swagger json `merged.json`
* The example above merges workflow search api and workflow management api.
