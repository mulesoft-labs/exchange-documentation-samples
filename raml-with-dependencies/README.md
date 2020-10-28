# RAML Fragment

This project demonstrates how to publish a RAML with dependencies to Exchange using Exchange API v2 API.

### How to publish to Exchange

1. Get an `ANYPOINT_TOKEN` from Anypoint Platform User explained in the root [README.md](../README.md) file of this repository.

2. Publish the RAML Fragment in your organization to be used as dependency of the main RAML [RAML_FRAGMENT_README.md](../raml-fragment/README.md).

3. Rename the `GROUP_ID` name of the folder `exchange_modules/GROUP_ID` by the group ID of the asset to publish.

4. Change the value `GROUP_ID` in the file `main.raml` to point to the right dependency.

5. Compress the folder `exchange_modules` and the file `main.raml` in a zip and call it `raml.zip`.

6. Execute the following command in your console
Replace the fields:
 - `organizationId`: organization ID of the organization where the asset will be published.
 - `groupId`: group ID of the asset to publish
 - `GROUP_ID`: group ID of the dependency (it should be the same of the asset)
 - `file-path`: local path where is the created file `raml.zip`

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=RAML asset name' \
  -F 'description=Description of the asset' \
  -F 'dependencies=GROUP_ID:exchange-documentation-fragment:1.0.0' \
  -F 'properties.mainFile=main.raml' \
  -F 'properties.apiVersion=v1' \
  -F 'files.raml.zip=@/file-path/raml.zip' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/exchange-documentation-raml-with-dependencies/1.0.0
```

_Note: `exchange-documentation-raml-with-dependencies` is the assetId and `1.0.0` is the version of the asset to be published. They could be changed._
