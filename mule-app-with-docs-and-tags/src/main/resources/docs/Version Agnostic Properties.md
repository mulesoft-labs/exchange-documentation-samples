Version agnostic properties apply to all versions of the asset. These properties are the asset’s `icon`, `name`, and `description`.

The following examples show how to update these properties.
 
Before executing the examples, obtain a token with the instructions in the `Anypoint Platform Token` section. In each example, replace `ANYPOINT_TOKEN` with your token.
 
In all examples, replace `:groupId` with the group ID of the asset to update, and replace `:assetId` with the asset ID of the asset to update.
 
You can send HTTP commands with cURL, Postman, or another application. These examples use cURL.
 
## Update an asset name

Replace `New name` with the new name for the asset.

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId' \
  -X 'PATCH' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"name":"New name"}'
```
 
 
## Update an asset description
 
Replace `New description` with the new description for the asset.

```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId' \
  -X 'PATCH' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: application/json' \
  -d '{"description":"New description"}'
```
 
 
## Update an asset icon
 
Replace `/file-path/image.png` with the path of the image file, and replace `image/png` with the correct content type of the image file.
 
 
```
curl 'https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/icon' \
  -X 'PUT' \
  -H 'accept: application/json' \
  -H 'authorization: bearer ANYPOINT_TOKEN' \
  -H 'content-type: image/png' \
  -T /file-path/image.png
```
