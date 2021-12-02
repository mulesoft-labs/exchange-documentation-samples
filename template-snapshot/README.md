# Mule Application Template

This application demonstrates how to publish a SNAPSHOT Mule application template to Exchange using the Exchange Maven Facade API version 3. It's similar to the Mule application project, but in this example the asset type is 'Template'. Exchange *Templates* are packaged integration patterns built on best practices to address common use cases.

## Publish to Exchange

1. Configure these credentials in your `~/.m2/settings.xml`:
    ```xml
      <server>
        <id>anypoint-exchange</id>
        <username>YOUR_USERNAME</username>
        <password>YOUR_PASSWORD</password>
      </server>
    ```
2. Execute the `grep` command explained in the root [README.md](../README.md) file of this repository (or just replace all the `YOUR_GROUP_ID` fields in the [README.md](./pom.xml) file).
3. Execute:

```shell
$ mvn clean deploy -DskipTests -Dlicense.skip=true
```

Successful execution produces output similar to this:

```shell
[INFO]   ------------------------------------------------------------
[INFO]   Publication status: completed
[INFO]   ------------------------------------------------------------
[INFO]     Steps:
[INFO]     - Description: Publishing asset
[INFO]     - Status: completed
[INFO]     .........................................
[INFO]   Your asset has been successfully published to Exchange.
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/snap-template/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```

## Advanced Example

Import [this template from Studio](https://docs.mulesoft.com/studio/7.5/import-project-exchange).
