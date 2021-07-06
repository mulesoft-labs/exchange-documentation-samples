# Mule application

This project demonstrates how to publish a simple Mule application to Exchange modifying asset mutable data while processing the asset. Such as `categories`, `custom fields`, `tags`, and `documentation`. The output should be a new asset created with the information used to describe them in the same request.

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
3. This example tries to publish the category and custom field, whose keys are: `categoryKey` and `fieldKey`. They have to be configured for your organization, we recommend changing the keys for some of your organization or creating both through our API, in the following links you will have more information:
- [Exchange - Manage categories](https://docs.mulesoft.com/exchange/to-manage-categories)
- [Exchange - Manage custom fields](https://docs.mulesoft.com/exchange/to-manage-custom-fields)

  *note that maven-assembly-plugin is configured in the pom file, to zip the content of `/src/main/resources/docs` and upload it during the deploy phase with the classifier `docs`*

4. Execute:

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
[INFO]   You can check it at: https://anypoint.mulesoft.com/api/v3/maven/exchange/YOUR_ORG_ID/hello-world-app/1.0.0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:10 min
[INFO] Finished at: 2020-09-22T15:23:59-03:00
[INFO] ------------------------------------------------------------------------
```
