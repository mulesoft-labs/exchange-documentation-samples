# Custom Lib

This project demonstrates how to publish a simple custom asset to Exchange using the Exchange Maven Facade API version 3.

Custom assets can package any Maven reusable component. In this example, the custom asset is a Java library.

The file uploaded to Exchange must have the classifier `custom`.

The file type can be `jar` or `zip`. In this example, the file type is `jar`.

Note that the pom.xml includes maven-jar-plugin to set the classifier of the artifact to `custom`.

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <version>${maven.jar.plugin.version}</version>
    <configuration>
        <classifier>custom</classifier>
    </configuration>
</plugin>
```

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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-lib/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```

## Advanced Example

Import this library in any Maven project:

```xml
<dependency>
    <groupId>YOUR_GROUP_ID</groupId>
    <artifactId>hello-world-lib</artifactId>
    <version>1.0.0</version>
    <classifier>custom</custom>
</dependency>
```
