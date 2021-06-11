You can delete an asset in the first seven days of its creation and reuse that asset’s name, group, asset ID, and version. Delete within the first seven days is known as a hard delete.
If you delete the asset after seven days, you can’t reuse its name, business group name, account ID, and version.
 
A delete after seven days is known as a soft delete. A soft delete, just like a hard delete, erases all information of the asset, its files, metadata, and its categorizations. However, unlike with a hard delete, the exact same group id, asset id and version combination can not be reused. If you want to reuse them, a hard delete before the seven days after the asset have been created should be executed.
 
In this article, there are some request examples that can be executed.
 
Before executing the examples, read the `Anypoint Platform Token` section to know how to obtain the token to be used in the examples. This should be replaced for the value `ANYPOINT_TOKEN` in each curl example.
 
The examples have been made by cURL, but optionally, instead of sending HTTP commands with cURL, you can use Postman or another application.
 
# How to delete an asset
 
The URL parameters that have to been replaced are the following:
  `:organizationId`: Organization of the asset
  `:groupId`: Group ID of the asset
  `:assetId`: Asset ID of the asset
  `:version`: Version of the asset
 
How to execute a soft-delete:
 
```
curl https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version \
  -X DELETE \
  -H 'Authorization: Bearer ANYPOINT_TOKEN' \
  -H 'x-delete-type: soft-delete'
```
 
How to execute a hard-delete:
 
```
curl https://anypoint.mulesoft.com/exchange/api/v2/assets/:groupId/:assetId/:version \
  -X DELETE \
  -H 'Authorization: Bearer ANYPOINT_TOKEN' \
  -H 'x-delete-type: hard-delete'
```
 
For more information about deleting an asset https://docs.mulesoft.com/exchange/to-delete-asset