@Library(value='jenkins-pipeline-library@master', changelog=false) _
pipelineRDPCWorkflowDocs(
    buildImage: "node:12.6.0",
    dockerRegistry: "ghcr.io",
    dockerRepo: "icgc-argo/workflow-docs",
    gitRepo: "icgc-argo/workflow-docs",
    testCommand: "npm ci && npm run test",
    helmRelease: "docs"
)
