# Custom Asset

This project demonstrates how to publish a simple Custom Asset that only contains a single POM file. The main use case that this asset type solves for the Maven experience is to be able to upload a parent POM file to Exchange that then you can then use inside any type of Maven projects, such as a Connector or a Mule Application.    

Notice that the pom.xml includes maven-jar-plugin to set the classifier of the artifact to `custom`

In order to publish this type of asset to Exchange, the pom file must contain the plugin `exchange-mule-maven-plugin`. Don't forget to include `<inherited>false</inherited>` in the plugin configuration and the property `<type>custom</type>`, otherwise it may not work properly.   

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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-pom/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```
4. Additionally, you can try using this as the parent pom of any or your maven projects:
```
<parent>
    <groupId>YOUR_GROUP_ID</groupId>
    <artifactId>hello-world-pom</artifactId>
    <version>1.0.0</version>
</parent>
```
