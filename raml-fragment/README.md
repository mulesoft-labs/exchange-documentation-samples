# RAML Fragment

This project demonstrates how to publish a simple RAML Fragment to Exchange using Exchange API v2 API.

### How to publish to Exchange

1. Get an `ANYPOINT_TOKEN` from Anypoint Platform User explained in the root [README.md](../README.md) file of this repository

2. Execute the following command in your console
Replace the fields:
 - `organizationId`: organization ID of the organization where the asset will be published.
 - `groupId`: group ID of the asset to publish
 - `file-path`: local path where is the file `queries.raml`

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=RAML Fragment asset name' \
  -F 'description=Description of the asset' \
  -F 'properties.mainFile=queries.raml' \
  -F 'files.raml-fragment.raml=@/file-path/queries.raml' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/exchange-documentation-fragment/1.0.0
```

_Note: `exchange-documentation-fragment` is the assetId and `1.0.0` is the version of the asset to be published. They could be changed._
