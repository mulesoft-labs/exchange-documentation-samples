# Graphql

This project demonstrates how to publish a simple GraphQL to Exchange using Exchange API v2 API.


## How to publish to Exchange

1. Get an `ANYPOINT_TOKEN` from Anypoint Platform User explained in the root [README.md](../README.md) file of this repository

2. Execute the following command in your console

Replace the fields:
 - `organizationId`: organization ID of the organization where the asset will be published.
 - `groupId`: group ID of the asset to publish
 - `assetId`: asset ID of the asset to publish
 - `version`: version of the asset to publish

 - `file-path`: local path where is the file `example.graphql`
 - `mainFile`: when the asset file is packaged as a zip file, the mainfile property it's used to identify the principal file
 - `classifier`: should be `graph` or `graph-apollo`

---

## Create a graphql asset

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -F 'name=Graphql example' \
  -F 'description=Description of the asset' \
  -F 'properties.mainFile=example.graphql' \
  -F 'files.graphql.graphql=@/:file-path/example.graph' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note the field `files.graphql.graphql` where the first `graphql` is the asset classifier and must be `graphql` to this asset type_

---

## Create a graphql-apollo asset

```
curl -v \
  -H 'Authorization: bearer ANYPOINT_TOKEN' \
  -F 'name=Graphql example' \
  -F 'description=Description of the asset' \
  -F 'properties.mainFile=example.graphql' \
  -F 'files.graphql-apollo.graphql=@/:file-path/example-apollo.graph' \
https://anypoint.mulesoft.com/exchange/api/v2/organizations/:organizationId/assets/:groupId/:assetId/:version
```

_Note the field `files.graphql-apollo.graph` where `graphql-apollo` is the asset classifier and must be `graphql-apollo` to this asset type_
