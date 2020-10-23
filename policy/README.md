# Mule Policy

This project demonstrates how to publish a simple Mule Policy to Exchange using Exchange Maven Facade v3 API.

### How to publish to Exchange

1. Make sure you have executed the `grep` command explained in the root [README.md](../README.md) file of this repository
2. Execute the following command in your console
```
mvn clean deploy
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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-custom-policy/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```
4. Additionally, you can try applying the Mule Policy using API Manager. For further information check [here](https://docs.mulesoft.com/api-manager/2.x/policies-landing-page)
