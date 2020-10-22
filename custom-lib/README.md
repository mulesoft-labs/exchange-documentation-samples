# Custom Lib

This project demonstrates how to publish a simple Custom Asset to Exchange using Exchange Maven Facade v3 API. In this case, the custom asset type corresponds to a Java library. You can use Custom Asset type to package whatever maven reusable component. It's important that the file uploaded to Exchange has the classifier `custom`. In this example, the type is jar but it could be either `jar` or `zip`.  

Notice that the pom.xml includes maven-jar-plugin to set the classifier of the artifact to `custom`

```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <version>${maven.jar.plugin.version}</version>
    <configuration>
        <classifier>custom</classifier>
    </configuration>
</plugin>
```

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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-lib/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```
4. Additionally, you can try importing the library in any or your maven projects:
```
<dependency>
    <groupId>YOUR_GROUP_ID</groupId>
    <artifactId>hello-world-lib</artifactId>
    <version>1.0.0</version>
    <classifier>custom</custom>
</dependency>
```
