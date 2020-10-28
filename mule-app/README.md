# Mule application

This project demonstrates how to publish a simple Mule application to Exchange using the Exchange Maven Facade API version 3.

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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-app/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```

## Advanced Example

1. Deploy the application in CloudHub using [Runtime Manager](https://docs.mulesoft.com/runtime-manager/deploying-to-cloudhub).
2. After the deployment is ready, call `http://<your-app-url>/helloWorld`.

Successful execution produces this:

```
Hello World!
```
