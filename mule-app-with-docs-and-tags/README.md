# Mule Application

This project demonstrates how to publish a simple Mule application to Exchange and modify the asset's mutable data while processing the asset. Mutable data includes `categories`, `custom fields`, `tags`, and `documentation`. The output is a new asset created with the information used to describe the data in the same request.

The Exchange user interface does not list Mule applications but does list Mule application templates. To create a Mule application template with mutable data, follow the example [Create Mule Application Template with Mutable Data](../template-with-mutable-data/README.md).

## Publish to Exchange

1. Configure these credentials in your `~/.m2/settings.xml`:
    ```xml
      <server>
        <id>anypoint-exchange</id>
        <username>YOUR_USERNAME</username>
        <password>YOUR_PASSWORD</password>
      </server>
    ```
2. Execute the `grep` command explained in the root [README.md](../README.md) file of this repository.
3. This example tries to publish the category and custom field, which have the keys `categoryKey` and `fieldKey`. They must be configured for your organization. Publication fails if they are not configured for your organization or if they are not deleted from the pom. We recommend changing the keys for some of your organization or creating both through our API. Find more information in the Exchange documentation:
- [Exchange - Manage Categories](https://docs.mulesoft.com/exchange/to-manage-categories)
- [Exchange - Manage Custom Fields](https://docs.mulesoft.com/exchange/to-manage-custom-fields)

  *Note that mule-maven-plugin will zip the content of `/exchange-docs` and upload it during the deploy phase with the classifier `docs`.*

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
