# Mule application

This project demonstrates how to publish a simple Mule Application to Exchange using Exchange Maven Facade v3 API.

### How to publish to Exchange

1. Make sure you have executed the `grep` command explained in the root [README.md](../README.md) file of this repository
2. Execute the following command in your console
```
mvn clean deploy -DskipTests
```
3. If everything is ok you’ll get:
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
4. Additionally, you can try deploying the application in CloudHub using [Runtime Manager](https://docs.mulesoft.com/runtime-manager/deploying-to-cloudhub). After the deploying is ready, call http://<your-app-url>/helloWorld and you should see the following output:
```
Hello World!
```
