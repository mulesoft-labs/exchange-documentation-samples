# Custom Asset

This project demonstrates how to publish a simple custom asset that contains only a single POM file. The main use case for this asset type in the Maven experience is uploading a parent POM file to Exchange. Then the file can be used in any type of Maven project, such as a connector or a Mule application.

Note that the pom.xml includes maven-jar-plugin to set the classifier of the artifact to `custom`.

To publish this type of asset to Exchange, the POM file must contain the plugin `exchange-mule-maven-plugin`. To work correctly, the file must include `<inherited>false</inherited>` in the plugin configuration and the property `<type>custom</type>`.

## Publish to Exchange

1. Make sure you have the following credentials configured in your `~/.m2/settings.xml`
    ```xml
      <server>
        <id>anypoint-exchange</id>
        <username>YOUR_USERNAME</username>
        <password>YOUR_PASSWORD</password>
      </server>
    ```
2. Execute the `grep` command explained in the root [README.md](../README.md) file of this repository.
3. Execute:

```shell
$ mvn clean deploy
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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-pom/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```

## Advanced Example

Use this as the parent POM of any Maven project:

```xml
<parent>
    <groupId>YOUR_GROUP_ID</groupId>
    <artifactId>hello-world-pom</artifactId>
    <version>1.0.0</version>
</parent>
```
