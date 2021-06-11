Exchange API v2 provides a new interface to create assets.

Exchange API version 2 can upload all supported asset types, including connectors, examples, templates, mule applications, and policies. These asset types are supported:

- `REST APIs` - An API specification that can be represented in RAML format or OAS (Swagger) format.
- `SOAP APIs` - An API specification in WSDL format.
- `HTTP APIs` - A placeholder for an endpoint for use by private Exchange users who want to manage the endpoint with API Manager.
- `API Groups` - A set of APIs bundled into a single asset.Instead of requesting access to multiple APIs to satisfy a use case, a developer can access the group in one step.
- `API Spec Fragments` - A RAML document that has a version and an identifier, but is not a complete RAML specification.API spec fragments are also known as RAML fragments.
- `Custom` - A description and an optional file to explain aspects of your system, to provide instructional videos, or to describe a product or organizational documentation.
- `Connectors` - Packaged connectivity to an endpoint developed and deployed on Anypoint Platform with third-party APIs and standard integration protocols. Use connectors within your application’s flows to send and receive data using a protocol or specific API. Anypoint Studio comes with many bundled connectors, and Exchange has many more.
- `Templates` - Packaged integration patterns built on best practices to address common use cases. You can add your information such as user credentials to complete the template’s use case or solution, and you can customize or extend templates as needed.
- `Examples` - Applications that are ready to run in Anypoint Studio and demonstrate a use case or solution.
- `Policies` - Configuration modules to extend the functionality of an API and enforce capabilities such as security.
- `Mule Application` - An application used to perform system integration.

## Create an Asset

There are two ways to upload an asset using this API.

The first way is to specify the properties in the multipart form data. This is similar to uploading an asset with the Exchange API version 1. A POM file is automatically created for the uploaded asset.

The second way is to upload the asset properties in a `pom.xml` file. If you do this, then two files are uploaded to create the asset.

Attempting to create an asset with defined asset properties in both multipart form data and a POM file causes an error.

Exchange API version 2 allows users to upload an asset in a synchronous or asynchronous way. We recommend the synchronous method for manual publication, and the asynchronous method for automated publication or to know the status of the publication process.

To use the synchronous method, add the header `x-sync-publication:true`. To use the asynchronous method, add the header `x-sync-publication:false` or send a request without the `x-sync-publication` header.

If the asset is published asynchronously, then a response like this is returned:

```
{
"publicationStatusLink":"https://anypoint.mulesoft.com/exchange/api/v2/organizations/67ac7cde-c02c-457f-b826-da2474e63d5a/assets/67ac7cde-c02c-457f-b826-da2474e63d5a/wsdl-asset/1.0.0/publication/status/d47a22a5-90f6-49eb-bfd0-d9fff575e022"
}
```

The endpoint `publicationStatusLink` provides the asset publication status.

Before executing the examples, obtain a token with the instructions in the `Anypoint Platform Token` section. In each example, replace `ANYPOINT_TOKEN` with your token.

You can send HTTP commands with cURL, Postman, or another application. These examples use cURL.

In all examples:

- Replace `:organizationId` with the organization ID of the organization where the asset will be published.
- Replace `:groupId` with the group ID of the asset to publish.
- Replace `:assetId` with the asset ID of the asset to publish.
- Replace `:version` with the version of the asset to publish.

## Upload an Asset with Properties in Multipart Form Data

Before trying any of these examples, understand all multipart fields in the request.

**Asset Properties**

All assets have these multipart field properties:

- `name`
- `description`
- `type`
- `dependencies`
- `keywords`
- `files`

Assets of some types have additional properties defined with the `properties` prefix.

For example, to define an asset’s `apiVersion`: `properties.apiVersion = v1`

Common asset properties include:

- `mainFile`: The name of the main file inside the zip archive. The main file must be in the root folder of the zip archive.
- `apiVersion`: Identifies the API version of the asset. `apiVersion` is used only for API asset types. Each major version of the asset must have a different `apiVersion`.
- `assetLink`: The URL of an external API.

**Files**

Specify each uploaded file by specifying its `packaging` and `classifier` after the prefix `files`.

For example, to upload a RAML file in a zip archive, use `files.raml.zip=@/...`, where `raml` is the classifier and `zip` is the packaging of the file.

It is not necessary that each file has a special name to be uploaded, as long as the classifier and packaging are well defined.

**Main properties**

These are the main properties of the asset. The `name` is required. If no file is uploaded from which the type can be inferred, then the `type` is required.

- `name`: The visible name of the asset.
- `description`: The description of the asset being created.
- `type`: The type of the asset to be created.If no `type` is specified, then `type` is inferred based on the file's classifier.
- `dependencies`: A string of comma-separated dependencies, defined as `dependencies=GROUP_ID:ASSET_ID:VERSION,GROUP_ID:ASSET_ID:VERSION`.
- `keywords`: A string of comma-separated values that represents the values to be saved as an asset's attributes.You can find assets by using `keywords` in the search. For example, `keywords` could be defined as: `keywords=api,raml,auth,jwt,token`

## Fat Package Generation

When an API specification asset is published, including RAML REST APIs, OAS REST APIs, and RAML fragments, the original zip file is modified and a new zip file is created.

After the asset is created, a file named exchange.json is added inside the original zip file with all the metadata information relevant to that API specification. The file is created with the information submitted in the publication form. If the file is already in the zip file, it is overwritten. If dependencies are declared in the publication form, and the original zip contains a directory with the name _exchange_modules_, then this directory is deleted.

In addition, a version of the same zip file called a _fat package_ is created as part of the asset files. Its classifier has the prefix fat, such as fat-raml. This version contains a directory called _exchange_modules_ with all the dependencies declared in the publication form.

## RAML

This example creates an asset of type `RAML`.

Download the file used in this example [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/68ef9520-24e9-4cf2-b2f5-620025690913/training-american-flights-api/1.0.0/files/fat-raml/zip).

Replace `/file-path/training-american-flights-api-1.0.0-raml.zip` with the local path of the downloaded file.

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `name`
- `description`
- `apiVersion`

Change the field `mainFile` only if another file is uploaded.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=RAML asset name' \
  -F 'description=Description of the asset' \
  -F 'keywords=this, is, the, best, raml' \
  -F 'dependencies=68ef9520-24e9-4cf2-b2f5-620025690913:training-american-flight-data-type:1.0.1,68ef9520-24e9-4cf2-b2f5-620025690913:training-american-flights-example:1.0.1' \
  -F 'properties.mainFile=american-flights-api.raml' \
  -F 'properties.apiVersion=v1' \
  -F 'files.raml.zip=@/file-path/training-american-flights-api-1.0.0-raml.zip' \  
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`raml`_ and _`zip`_ packaging. You may instead upload a single file with packaging _`.raml`_ and the _`type`_ specified._

_Note: The given zip file has dependencies, so this example uses the property _`dependencies`_ to list them. In many cases there are no dependencies to specify and the property _`dependencies`_ is not used._

## RAML Fragment

This example creates an asset of type `RAML Fragment`.

Download the file used in this example [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/org.mule.examples/fhir-r4-commons-library/1.0.1/files/raml-fragment/zip).

Replace `/Users/llucas/Downloads/training-oauth20-security-scheme-1.0.2-raml-fragment.zip` with the local path of the downloaded file.

Change these fields:

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `description`
- `name`

Change the field `mainFile` only if another file is uploaded.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=RAML Fragment asset name' \
  -F 'description=Description of the asset' \
  -F 'properties.mainFile=OAuth2.raml' \
  -F 'files.raml-fragment.zip=@/file-path/training-oauth20-security-scheme-1.0.2-raml-fragment.zip' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`raml-fragment`_ and _`zip`_ packaging. You may instead upload a single file with packaging _`.raml`_ and the _`type`_ specified._

### RAML and RAML Fragment Dependencies

Creating a RAML or RAML Fragment with dependencies requires these additional steps.

Replace `GROUP_ID`, `ASSET_ID` and `VERSION` with the groupId, assetId, and version of each dependency.

1. For each dependency, add the dependency property in the multipart form data. Example: `-F 'dependencies=GROUP_ID:ASSET_ID:VERSION`
2. Download each dependency RAML from Anypoint.
3. Place each dependency's content in a folder with the folder structure `exchange_modules/GROUP_ID/ASSET_ID/VERSION/all_the_content`.`all_the_content` is the decompressed content of the dependency.
4. Create a zip file with the `exchange_modules` folder and the content of the RAML or RAML fragment to upload.
5. Upload the zip file using the multipart form data as described in the examples.Use the name `files.raml.zip` for a RAML asset or `files.raml-fragment.zip` for a RAML fragment.

_When a RAML or RAML fragment is published, the original zip file is modified and a new zip file is created as described in the previous section Fat Package Generation._

## OAS API (Swagger)

This example creates an asset of type `OAS`.

Download the file used in this example [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/org.mule.examples/verato/1.0.0/files/oas/zip).

Replace `/Users/llucas/Downloads/verato-1.0.0-oas.zip` with the local path of the downloaded file.

Change these fields:

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `name`
- `description`
- `apiVersion`

Change the field `mainFile` only if another file is uploaded.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=OAS asset name' \
  -F 'description=Description of the asset' \
  -F 'properties.mainFile=verato.json' \
  -F 'properties.apiVersion=v1' \
  -F 'files.oas.zip=@/file-path/verato-1.0.0-oas.zip' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`oas`_ and _`zip`_ packaging. You may instead upload a single _`oas`_ file with packaging _`.oas`_._

_When an OAS is published, the original zip file is modified and a new zip file is created as described in the previous section Fat Package Generation._

## SOAP API (WSDL)

This example creates an asset of type `WSDL`.

Change these fields:

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `name`
- `mainFile` (if a file is uploaded)
- `assetLink` (if no file is uploaded)
- `apiVersion`

To create a WSDL by specifying an asset file:

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=WSDL asset name' \
  -F 'description=The wsdl v2' \
  -F 'properties.apiVersion=v1' \
  -F 'properties.mainFile=main.wsdl' \
  -F 'files.wsdl.zip=@/file-path/wsdl.zip' \  
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`wsdl`_ and _`zip`_ packaging. You may instead upload a single _`wsdl`_ file with packaging _`.wsdl`_._

To create a WSDL by specifying an asset link:

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=WSDL asset name' \
  -F 'description=Description of the asset' \
  -F 'type=soap-api' \
  -F 'properties.apiVersion=v1' \
  -F 'properties.assetLink=http://my-wsdl-api.com' \   https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: When using an asset link, the type cannot be inferred, so we define the asset _`type`_._

# Custom

This example creates an asset of type `Custom`.

Download the file used in this example [here](https://github.com/mulesoft-labs/exchange-documentation-samples/blob/master/custom-lib/src/main/java/HelloWorld.java).

Replace `/file-path/library.jar` with the local path of the downloaded file.

Change these fields:

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `name`
- `description`

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=custom asset name' \
  -F 'description=Description of the asset' \
  -F 'type=custom' \
  -F files.custom.zip=@/file-path/library.jar \  
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`custom`_ and _`zip`_ packaging._

_Note: When the asset type is "Custom", uploading a file is optional._

# HTTP API

This example creates an asset of type `HTTP`.

Increase the major version for each new version of an HTTP API. For example, increase from `1.0.0` to `2.0.0`.

Change these fields:

- `organizationId`
- `groupId`
- `assetId`
- `version`
- `name`
- `description`
- `assetLink`
- `apiVersion`

_Note: The type field is specified because it can not be inferred from a file classifier._

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=http asset name' \
  -F 'description=Description of the asset' \
  -F 'type=http-api' \
  -F 'properties.assetLink=http://www.my-http-api-url.com' \
  -F 'properties.apiVersion=v3' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

## API Group

To create an API Group from API Manager, see the API Manager documentation page [API Groups](https://docs.mulesoft.com/api-manager/latest/api-groups-landing-page).

_Note: The previous examples show how to upload assets of type RAML, RAML Fragment, OAS, WSDL, HTTP API and Custom. The rest of the asset types are uploaded similarly._

# Upload an Asset with Properties in a POM File

A POM file is an xml file named `pom.xml` or just `.pom` with this structure:

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>YOUR_GROUP_ID</groupId>
  <artifactId>YOUR_ASSET_ID</artifactId>
  <version>YOUR_VERSION</version>
  <name>The asset name</name>
  <description>The asset description</description>
  <properties>
    <keywords>these, are, keywords, to, be, indexed</keywords>
    <mainFile>api.raml</mainFile>
  </properties>

  <dependencies>
    <dependency>
      <groupId>DEPENDENCY_GROUP_ID</groupId>
      <artifactId>DEPENDENCY_ASSET_ID</artifactId>
      <version>DEPENDENCY_VERSION</version>
    </dependency>
  </dependencies>
</project>
```

The `groupId`, `artifactId` (assetId) and `version` represent the asset that will be uploaded.

The properties of the asset, including `keywords`, are placed inside the `properties` tag. In the previous example, `mainFile` is specified inside the `properties` tag.

If a file is uploaded and the `type` can be inferred from the file’s classifier, then it is not necessary to specify the `type` property.

Only some assets require defining the `<dependencies>` field.

After creating the POM file, upload the POM file and the asset file in a request like this:

```
curl -v
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -F 'files.mule-application.jar=@/file-path/mule-app.jar' \
  -F 'files.pom=@/file-path/mule-app.pom' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

The main file is `files.mule-application.jar`, with the classifier `mule-application` and the packaging `jar`. The pom file is `files.pom`, with only the packaging `pom`.

_Important: The POM groupId, assetId, and version parameters must match the URL path parameters._

The following examples show how to upload an asset with a POM file, including an OAS asset, a Connector asset, and a Mule application asset. Connector assets are typically uploaded by Maven.

## OAS

Create the POM file (`pom.xml`). Replace the `:groupId`, `:assetId`, `:version`, `name`, `description`, `apiVersion`, and `mainFile`.

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>:groupId</groupId>
  <artifactId>:assetId</artifactId>
  <version>:version</version>
  <name>oas name</name>
  <description>The asset description</description>
  <properties>
    <apiVersion>v1</apiVersion>
    <mainFile>verato.json</mainFile>
  </properties>
</project>
```

For this example, download this OAS file [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/org.mule.examples/verato/1.0.0/files/oas/zip).

Replace `/file-path/verato-1.0.0-oas.zip` with the local path where the file has been downloaded.

Replace `/file-path/pom.xml` with the local path of the created pom.xml file.

Replace the `:organizationId`, `:groupId`, `:assetId`, and `:version`.

Execute the request.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'files.pom.xml=@/file-path/pom.xml' \
  -F 'files.oas.zip=@/file-path/verato-1.0.0-oas.zip' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`oas and _`zip`_ packaging.`files.pom`identifies the POM file. Alternatively, you may use`files.pom.xml\`.\_\_

## Connector

This asset type requires a POM file and a JAR file to be uploaded. If a POM file is not uploaded, the multipart form data properties must be defined. The POM file will be automatically generated with those properties.

Create the POM file:

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>:groupId</groupId>
  <artifactId>:assetId</artifactId>
  <version>:version</version>
  <name>connector name</name>
  <description>connector description</description>
</project>
```

_Important: Defining this POM will create the asset, but the connector will work only if the correct dependencies and properties are set. For this case, the real POM can be obtained _[_here_](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/com.mulesoft.connectors/mule-salesforce-connector/10.4.1/files/pom)_ and can be used ONLY as a reference._

Download the JAR file used in this example [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/com.mulesoft.connectors/mule-salesforce-connector/10.4.1/files/mule-plugin/jar).

Replace `/file-path/mule-salesforce-connector-10.4.1-mule-plugin.jar` with the local path of the downloaded JAR file.

Replace `/file-path/pom.xml` with the local path of the created pom.xml file.

Replace the `:organizationId`, `:groupId`, `:assetId`, and `:version`.

Execute the request.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'files.pom=@/file-path/pom.xml' \
  -F 'files.mule-plugin.jar=@/file-path/mule-salesforce-connector-10.4.1-mule-plugin.jar' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`mule-plugin`_ and _`jar`_ packaging. _`files.pom`_ identifies the POM file. Alternatively, you may use _`files.pom.xml`_._

## Mule Application

This asset type requires a POM file and a JAR file to be uploaded. If a POM file is not uploaded, the multipart form data properties must be defined. The POM file will be automatically generated with those properties.

Create the POM file:

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>:groupId</groupId>
  <artifactId>:assetId</artifactId>
  <version>:version</version>
  <name>mule application name</name>
  <description>asset description</description>
</project>
```

_Important: Defining this POM will create the asset, but the mule application will work only if the correct dependencies and properties are set. In this case, the real POM can be obtained _[_here_](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/com.mulesoft.munit.utils/munit-integration-tests/2.0.1/files/pom)_ and can be used ONLY as a reference._

Download the JAR file used in this example [here](https://anypoint.mulesoft.com/exchange/organizations/68ef9520-24e9-4cf2-b2f5-620025690913/assets/com.mulesoft.munit.utils/munit-integration-tests/2.0.1/files/mule-application/jar).

Replace `/file-path/munit-integration-tests-2.0.1-mule-application.jar` with the local path of the downloaded JAR file.

Replace `/file-path/pom.xml` with the local path of the created pom.xml file. Replace the asset file path.

Replace the `:organizationId`, `:groupId`, `:assetId`, and `:version`.

Execute the request.

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'files.pom=@/file-path/pom.xml' \
  -F 'files.mule-application.jar=@/file-path/munit-integration-tests-2.0.1-mule-application.jar' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note: This example uploads a file with classifier _`mule-application`_ and _`jar`_ packaging. _`files.pom`_ identifies the POM file. Alternatively, you may use _`files.pom.xml`_._

_Note: Many of these assets are commonly uploaded by Maven, such as Connectors, Examples, Templates, Mule Applications, and Policies. The POM file to upload these assets is the same POM file that is usually uploaded by Maven._
