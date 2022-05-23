# AsyncAPI

This project demonstrates how to publish an AsyncAPI to Exchange using Exchange API v2 API.

### How to publish to Exchange

1. Get an `ANYPOINT_TOKEN` from Anypoint Platform User explained in the root [README.md](../README.md) file of this repository

2. Execute the following command in your console
Replace the fields:
 - `organizationId`: organization ID of the organization where the asset will be published.
 - `groupId`: group ID of the asset to publish
 - `file-path`: local path where is the file `async-trade-request-api.zip`

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -H 'x-sync-publication: true' \
  -F 'name=YAML AsyncAPI asset name' \
  -F 'description=Description of the asset' \
  -F 'properties.apiVersion=v1' \
  -F 'properties.mainFile=async-trade-request-api.yaml' \
  -F 'files.evented-api.zip=@/file-path/async-trade-request-api.zip' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/exchange-documentation-asyncapi/1.0.0
```

_Note: `exchange-documentation-asyncapi` is the assetId and `1.0.0` is the version of the asset to be published. They could be changed._