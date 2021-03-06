#pool: Default
#steps:
#- script: mvn clean install
#  displayName: 'Maven Packaging'

#- script: |
#    echo Add other tasks to build, test, and deploy your project.
#    echo successfully built
#  displayName: 'Run a multi-line script'

trigger:
- dev

pool: Default

stages: 
- stage: Build
  displayName: Build stage
  jobs:
  - job: MavenPackageAndPublishArtifacts
    displayName: Maven Package and Publish Artifacts
          
    steps:
    - script: mvn clean install
      displayName: 'Maven Package'
    - script: mvn deploy
      displayName: 'Publish Artifact'
   # - task: PublishBuildArtifacts@1
  #    displayName: 'Publish Artifacts'
  #    inputs:
   #     pathtoPublish: '$(Build.ArtifactStagingDirectory)'
   #     artifactName: 'springboot_artifact'
  #  - task: CopyFiles@2
   #   displayName: 'Copy Files to artifact staging directory'
   #   inputs:
   #     SourceFolder: '$(System.DefaultWorkingDirectory)'
   #     Contents: '**/target/*.?(war|jar)'
   #     TargetFolder: $(Build.ArtifactStagingDirectory)
   # - upload: $(Build.ArtifactStagingDirectory)
   #   artifact: 'springboot_artifact'
