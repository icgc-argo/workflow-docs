
 ## About the repository
 This repository contains two parts: swagger json merge tool and a node application that serves WES api.

### Swagger Combine 
#### Why swagger docs need to be combined?
WES API is a standard that describes how to run and manage workflows. We currently have two workflow APIs: 
workflow management and workflow search. In order for the users to interact with all APIs through a single 
entry point, a combined swagger doc is needed for centralizing separate APIs.

Swagger combine(`merge.js` and `diff.js`)is a simple tool to shallow-merge two or more swagger 2.0 specs into one.

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

Example:
* combine 3 swagger specs:

```
node merge.js -o merged.json WES-swagger-template.json http://wf-search.light.overture.bio/v2/api-docs http://wf-management.light.overture.bio/v2/api-docs
    
```
* `WES-swagger-template.json` is a pre-defined json template for WES api.
* The tool outputs a merged swagger json `merged.json`
* The example above merges workflow search swagger doc and workflow management swagger doc.

### WES API Swagger Doc
This repo also contains a node application that uses `swagger-ui-express` to serve the combined WES API.

#### Install
`npm install`

#### Run
Run the application on default port 3000:
```
node app.js
```
Run the application on other port:
```
PORT=9999 node app.js
```

