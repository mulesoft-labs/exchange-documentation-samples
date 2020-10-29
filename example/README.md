# Mule Application Example

This project demonstrates how to publish a simple Mule application example to Exchange using the Exchange Maven Facade API version 3. It's similar to the Mule application project, but in this example the asset type is 'Example'. Exchange *Examples* are applications that are ready to run in Anypoint Studio and demonstrate a use case or solution.

## Publish to Exchange

1. Execute the `grep` command explained in the root [README.md](../README.md) file of this repository.
2. Execute:

```
mvn clean deploy -DskipTests
```

Successful execution produces output similar to this:

```
[INFO]   ------------------------------------------------------------
[INFO]   Publication status: completed
[INFO]   ------------------------------------------------------------
[INFO]     Steps:
[INFO]     - Description: Publishing asset
[INFO]     - Status: completed
[INFO]     .........................................
[INFO]   Your asset has been successfully published to Exchange.
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-example/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```

## Advanced Example

Import [this template from Studio](https://docs.mulesoft.com/studio/7.5/import-project-exchange).
